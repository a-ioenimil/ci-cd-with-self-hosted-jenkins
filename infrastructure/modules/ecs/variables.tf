variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "agent_image" {
  description = "Docker image for Jenkins agent"
  type        = string
  default     = "jenkins/inbound-agent:latest"
}

variable "agent_cpu" {
  description = "CPU units for the agent task (1024 = 1 vCPU)"
  type        = string
  default     = "1024"
}

variable "agent_memory" {
  description = "Memory (MiB) for the agent task"
  type        = string
  default     = "2048"
}
