####################################################################
# Backend Infrastructure Main Terraform File
####################################################################

# Configure the S3 Backend #


resource "aws_s3_bucket" "tf_state" {
  bucket = var.s3_bucket_name

  tags = merge(var.tags, {
    name = var.s3_bucket_name
  })
}

resource "aws_s3_bucket_public_access_block" "s3_public_access_block" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



# Create DynamoDB Table for State Locking #

resource "aws_dynamodb_table" "tf_state_lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(var.tags, {
    Name = var.dynamodb_table
  })
}