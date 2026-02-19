resource "aws_ecs_cluster" "jenkins_agents" {
  name = "${var.project_name}-agents"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "${var.project_name}-agents"
  }
}

resource "aws_cloudwatch_log_group" "jenkins_agents" {
  name              = "/jenkins/agents"
  retention_in_days = 14

  tags = {
    Name = "${var.project_name}-agent-logs"
  }
}

resource "aws_ecs_task_definition" "jenkins_agent" {
  family                   = "${var.project_name}-agent"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.agent_cpu
  memory                   = var.agent_memory
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name      = "jenkins-agent"
      image     = var.agent_image
      essential = true

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.jenkins_agents.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "agent"
        }
      }
    }
  ])

  tags = {
    Name = "${var.project_name}-agent-task"
  }
}
