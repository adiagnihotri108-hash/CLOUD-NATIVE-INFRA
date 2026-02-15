import json
import boto3
import os

s3 = boto3.client("s3")
dynamodb = boto3.resource("dynamodb")

TABLE_NAME = os.environ.get("TABLE_NAME")
table = dynamodb.Table(TABLE_NAME)


def lambda_handler(event, context):
    print("Event Received:", json.dumps(event))

    # Validate S3 trigger
    if "Records" not in event:
        return {
            "statusCode": 200,
            "body": json.dumps("Manual test executed successfully — no S3 trigger")
        }

    for record in event["Records"]:
        bucket = record["s3"]["bucket"]["name"]
        key = record["s3"]["object"]["key"]

        response = s3.get_object(Bucket=bucket, Key=key)
        content = response["Body"].read().decode("utf-8")
        data = json.loads(content)

        table.put_item(Item=data)

    return {
        "statusCode": 200,
        "body": json.dumps("Data inserted successfully into DynamoDB")
    }
