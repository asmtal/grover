module "iam" {
  source = "../../_modules/iam"

  environment = var.environment
  app_name    = var.app_name
}