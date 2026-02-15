variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}


variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store Terraform state"
  type        = string
  default     = "my-terraform-state-bucket-dev"
}


variable "dynamodb_table" {
  description = "The name of the DynamoDB table for Terraform state locking"
  type        = string
  default     = "terraform-locks"
}


variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}


