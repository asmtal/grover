terraform {
  backend "s3" {
    bucket                  = "tst-tf-states"
    key                     = "stg/ecs_cluster.state"
    region                  = "eu-west-3"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "stg-terraform-deployer"
  }
}