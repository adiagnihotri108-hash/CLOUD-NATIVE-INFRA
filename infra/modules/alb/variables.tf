variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB is deployed"
  type        = string
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs where the ALB will be deployed"
  default     = []
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs to associate with the ALB"
  default     = []
}

variable "internal" {
  description = "Boolean to specify if the ALB is internal or internet-facing"
  type        = bool
  default     = false
}


variable "tags" {
  description = "Tags to be applied to the ALB"
  type        = map(string)
  default     = {}
}

variable "port" {
  description = "Port on which the target group is listening"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "enabled" {
  description = "Enable health checks for the target group"
  type        = bool
  default     = true
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "Protocol for the health check"
  type        = string
  default     = "HTTP"
}

variable "health_check_matcher" {
  description = "HTTP codes to use when checking for a successful response from a target"
  type        = string
  default     = "200"
}

variable "health_check_interval" {
  description = "Approximate interval, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 5
}

variable "unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering a target unhealthy"
  type        = number
  default     = 2
}

variable "listener_port" {
  description = "Port on which the ALB will listen"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener"
  type        = string
  default     = "HTTP"
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

