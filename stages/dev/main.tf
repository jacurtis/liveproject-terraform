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

module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  vpc_id = module.network.vpc_id
  ssh_key = var.ssh_key
}

module "compute" {
  source = "../../modules/compute"

  project_name = var.project_name
  bastion_sg_id = module.security.bastion_sg_id
  public_subnets = module.network.public_subnets
  key_name = module.security.key_pair.key_name
}