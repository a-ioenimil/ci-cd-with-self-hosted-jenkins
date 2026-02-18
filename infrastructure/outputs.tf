output "jenkins_alb_url" {
  description = "The URL of the Jenkins Application Load Balancer"
  value       = "http://${module.alb.alb_dns_name}"
}
