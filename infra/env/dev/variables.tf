##################################################################
#                        VPC VARIABLES                           #
##################################################################

variable "my_vpc" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "ngtw" {
  description = "Enable NAT Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway"
  type        = bool
}

variable "multi_ngtw" {
  description = "Use one NAT Gateway per AZ"
  type        = bool
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)

}




variable "role_name" {
  type = string
}

variable "managed_policy_arns" {
  type    = list(string)
  default = []
}

variable "s3_bucket_name" {
  type = string
}


variable "dynamodb_name" {
  description = "The name of the DynamoDB table for App data storage"
  type        = string
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "The name of the Target Group for the ALB"
  type        = string
}

variable "target_group_arns" {
  description = "List of target group ARNs to associate with the ASG"
  type        = list(string)
  default     = []
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}


variable "instance_type" {
  description = "Please provide instance_type"
  type        = string
}

variable "key_name" {
  description = "value"
  type        = string
}

variable "template_name" {
  description = "value"
  type        = string
}

# Lambda-specific variables

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "ec2_role_name" {
  description = "The name of the IAM role for EC2"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda"
  type        = string
}
