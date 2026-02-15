variable "lambda_role_name" {
  type = string
}

variable "lambda_s3_bucket_arn" {
  type = string
}

variable "lambda_dynamodb_table_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}