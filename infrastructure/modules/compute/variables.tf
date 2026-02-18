variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "subnet_id" {
  description = "Subnet ID for the Jenkins instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the instance"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}
