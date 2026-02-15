aws_region     = "ap-south-1"
s3_bucket_name = "my-terraform-state-bucket-qa"
dynamodb_table = "terraform-locks"

tags = {
  Project     = "aws-cloud-native-infra"
  Owner       = "Aditya_Agnihotri"
  ManagedBy   = "Terraform"
  Environment = "qa"
}