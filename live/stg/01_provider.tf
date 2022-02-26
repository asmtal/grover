terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.13"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region                   = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "stg-terraform-deployer"
  default_tags {
    tags = {
      Owner = "terraform"
      Env   = "${var.environment}"
    }
  }
}
