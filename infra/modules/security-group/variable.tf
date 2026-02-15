variable "name" {
  type        = string
  description = "Security group name"
}

variable "description" {
  type        = string
  description = "Security group description"
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ingress_cidr_rules" {
  description = "List of ingress rules with CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string, "")
  }))
  default = []
}

variable "ingress_sg_rules" {
  description = "List of ingress rules with security groups"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
    description     = optional(string, "")
  }))
  default = []
}

variable "ingress_rules" {
  description = "DEPRECATED - use ingress_cidr_rules and ingress_sg_rules instead"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    security_groups = optional(list(string), [])
    description     = optional(string, "")
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string, "")
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}
