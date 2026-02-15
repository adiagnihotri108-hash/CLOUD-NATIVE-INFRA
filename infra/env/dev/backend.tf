terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-dev-aditya-agnihotri"
    key            = "env/dev/terraform.tfstate"
    region         = "ap-south-1" 
    dynamodb_table = "terraform-locks-dev"
    state_lock = false
  }
}