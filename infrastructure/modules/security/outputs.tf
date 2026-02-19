output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "jenkins_sg_id" {
  value = aws_security_group.jenkins_sg.id
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ssm_profile.name
}

output "ecs_agent_sg_id" {
  description = "Security group ID for ECS agent tasks"
  value       = aws_security_group.ecs_agent_sg.id
}

output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  description = "ARN of the ECS task role"
  value       = aws_iam_role.ecs_task_role.arn
}
