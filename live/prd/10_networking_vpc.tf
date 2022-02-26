data "aws_availability_zones" "available" {}

#Global
module "networking" {
  source = "../../_modules/networking"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
}