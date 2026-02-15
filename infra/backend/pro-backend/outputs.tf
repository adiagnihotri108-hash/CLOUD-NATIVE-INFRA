output "s3_tf_state" {
  value       = aws_s3_bucket.tf_state.bucket
  description = "The name of the S3 bucket used for Terraform state storage"
}

output "s3_tf_state_arn" {
  value       = aws_s3_bucket.tf_state.arn
  description = "The ARN of the S3 bucket used for Terraform state storage"
}


output "dynamoDBtf_state_lock" {
  value       = aws_dynamodb_table.tf_state_lock.name
  description = "The name of the DynamoDB table used for Terraform state locking"
}


output "dynamoDBtf_state_lock_arn" {
  value       = aws_dynamodb_table.tf_state_lock.arn
  description = "The ARN of the DynamoDB table used for Terraform state locking"
}