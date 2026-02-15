variable "ec2_role_name" {
  type = string
}

variable "s3_bucket_arn" {
  type = string
}

variable "dynamodb_table_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
