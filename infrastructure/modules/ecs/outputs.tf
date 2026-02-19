output "cluster_arn" {
  description = "ARN of the ECS cluster for Jenkins agents"
  value       = aws_ecs_cluster.jenkins_agents.arn
}

output "task_definition_arn" {
  description = "ARN of the Jenkins agent task definition"
  value       = aws_ecs_task_definition.jenkins_agent.arn
}

output "log_group_name" {
  description = "CloudWatch log group name for agent logs"
  value       = aws_cloudwatch_log_group.jenkins_agents.name
}
