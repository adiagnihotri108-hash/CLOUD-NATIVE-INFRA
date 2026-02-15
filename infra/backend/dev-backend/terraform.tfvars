aws_region     = "ap-south-1"
s3_bucket_name = "my-terraform-state-bucket-dev-aditya-agnihotri"
dynamodb_table = "terraform-locks-dev"

tags = {
  Project     = "aws-cloud-native-infra"
  Owner       = "Aditya_Agnihotri"
  ManagedBy   = "Terraform"
  Environment = "dev"
}


