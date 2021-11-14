provider "aws" {
  region = var.region
  profile = var.profile
  default_tags {
    tags = {
      "Project" = "Liveproject-Terraform"
      "CreatedBy" = "Terraform"
    }
  }
}

module "network" {
  source = "../../modules/network"

  vpc_cidr_block = "172.16.0.0/16"
}