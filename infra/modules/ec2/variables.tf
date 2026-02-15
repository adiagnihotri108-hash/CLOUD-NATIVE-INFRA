variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the EC2 instance"
  type        = map(string)
  default     = {}
}

variable "target_group_arn" {
  description = "ARN of the target group to attach the EC2 instance"
  type        = string
}

variable "target_group_port" {
  description = "Port on which the target group is listening"
  type        = number
  default     = 80
}

variable "iam_instance_profile" {
  type    = string
  default = null
}
