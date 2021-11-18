output "vpc_id" {
  description = "The ID for the primary VPC created for the network"
  value = aws_vpc.primary.id
}

output "public_subnets" {
  value = { for key, subnet in aws_subnet.public: key => subnet.id }
}

output "private_app_subnets" {
  value = { for key, subnet in aws_subnet.private_app: key => subnet.id }
}

output "private_db_subnets" {
  value = { for key, subnet in aws_subnet.private_db: key => subnet.id }
}