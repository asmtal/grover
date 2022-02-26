module "ecs" {
  source = "../../_modules/ecs"

  environment           = var.environment
  app_name              = var.app_name
  docker_image          = var.docker_image
  vpc_id                = module.networking.vpc_id
  private_subnets_id    = module.networking.private_subnets_id
  public_subnets_id     = module.networking.public_subnets_id
  fargate_memory        = var.fargate_memory
  fargate_cpu           = var.fargate_cpu
  app_container_port    = var.app_container_port

  depends_on = [
    module.networking,
  ]
}