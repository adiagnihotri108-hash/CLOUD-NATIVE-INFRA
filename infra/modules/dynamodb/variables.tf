variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The name of the hash key attribute"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the DynamoDB table"
}