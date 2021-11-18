output "vpc_id" {
  value = module.network.vpc_id
  description = "The ID for our Full Network VPC"
}

output "public_subnet_ids" {
  value = module.network.public_subnets
}

output "private_app_subnet_ids" {
  value = module.network.private_app_subnets
}

output "private_db_subnet_ids" {
  value = module.network.private_db_subnets
}