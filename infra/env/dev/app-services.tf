# App S3 Bucket

module "app_s3" {
  source = "../../modules/S3"

  bucket_name = "${var.s3_bucket_name}-${random_id.bucket_suffix.hex}"
  versioning  = true
  tags        = merge(var.tags, { name = var.s3_bucket_name })
}

resource "random_id" "bucket_suffix" {
  byte_length = 3
}

# DynamoDB Table

module "app_dynamodb" {
  source = "../../modules/dynamodb"

  table_name = var.dynamodb_name
  hash_key   = "id"

  tags = merge(var.tags, { name = var.dynamodb_name })
}



