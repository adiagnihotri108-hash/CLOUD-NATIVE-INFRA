##########################################################################
#                 Development Environment Terraform Variables            #
##########################################################################

##### VPC Configuration #####

my_vpc             = "vpc_dev"
vpc_cidr           = "10.0.0.0/16"
azs                = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
ngtw               = true
single_nat_gateway = false
multi_ngtw         = true
region             = "ap-south-1"
tags = {
  "project"     = "aws-cloud-native-infra"
  "owner"       = "Aditya_Agnihotri"
  "managedby"   = "Terraform"
  "environment" = "dev"
}


##### IAM Role Configuration #####

role_name = "dev-ec2-role-this-is-iam-role"
managed_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
]
s3_bucket_name = "dev-ec2-s3-bucket"


dynamodb_name = "dev-app-dynamodb-table"


# ASG Configuration

asg_name             = "dev-app-asg"
asg_min_size         = 1
asg_max_size         = 3
asg_desired_capacity = 2
instance_type        = "t3.micro"
key_name             = "dev-ec2-keypair"
template_name        = "dev-app-launch-template"


# ALB Configuration

alb_name          = "dev-alb"
target_group_name = "dev-alb-target-group"

# Lambda Configuration

lambda_function_name = "Lambda_function_dev"

lambda_role_name = "dev-lambda-role"
ec2_role_name    = "dev-ec2-role"







