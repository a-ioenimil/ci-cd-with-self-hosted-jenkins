variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "jenkins-lab"
}

variable "instance_type" {
  description = "Instance Type for Jenkins"
  type        = string
  default     = "t3.medium"
}
