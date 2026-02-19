output "jenkins_alb_url" {
  description = "The URL of the Jenkins Application Load Balancer"
  value       = "http://${module.alb.alb_dns_name}"
}

output "ecr_repository_url" {
  description = "ECR repository URL — use in Jenkins pipelines"
  value       = module.ecr.repository_url
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN — configure in Jenkins ECS Cloud plugin"
  value       = module.ecs.cluster_arn
}

output "ecs_agent_subnet_ids" {
  description = "Private subnet IDs for ECS agent tasks"
  value       = module.networking.private_subnets
}

output "ecs_agent_security_group_id" {
  description = "Security group ID for ECS agent tasks"
  value       = module.security.ecs_agent_sg_id
}

output "jenkins_private_ip" {
  description = "Jenkins controller private IP — used as JNLP tunnel address"
  value       = module.compute.jenkins_private_ip
}
