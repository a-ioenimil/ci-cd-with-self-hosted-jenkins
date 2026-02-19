module "networking" {
  source = "./modules/networking"

  vpc_cidr     = "10.0.0.0/16"
  project_name = var.project_name
}

module "security" {
  source = "./modules/security"

  vpc_id       = module.networking.vpc_id
  project_name = var.project_name
}

module "compute" {
  source = "./modules/compute"

  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  subnet_id             = module.networking.private_subnets[0]
  instance_type         = var.instance_type
  instance_profile_name = module.security.instance_profile_name
  security_group_id     = module.security.jenkins_sg_id
}

module "alb" {
  source = "./modules/alb"

  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  public_subnets        = module.networking.public_subnets
  alb_security_group_id = module.security.alb_sg_id
  target_instance_id    = module.compute.jenkins_instance_id
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "${var.project_name}-repo"
}

module "ecs" {
  source = "./modules/ecs"

  project_name                = var.project_name
  region                      = var.region
  ecs_task_execution_role_arn = module.security.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.security.ecs_task_role_arn
}
