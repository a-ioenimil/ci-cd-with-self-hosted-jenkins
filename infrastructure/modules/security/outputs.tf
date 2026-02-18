output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "jenkins_sg_id" {
  value = aws_security_group.jenkins_sg.id
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ssm_profile.name
}
