variable "lambda_function_name" {
  type        = string
  description = "Lambda function name"
}

variable "lambda_role_arn" {
  type        = string
  description = "IAM role ARN for Lambda"
}

variable "handler" {
  type    = string
  default = "handler.lambda_handler"
}

variable "runtime" {
  type    = string
  default = "python3.10"
}

variable "timeout" {
  type    = number
  default = 30
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "enable_s3_trigger" {
  type    = bool
  default = false
}

variable "s3_bucket_name" {
  type    = string
  default = ""
}

variable "s3_bucket_arn" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
