resource "aws_vpc" "primary" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.project_name} VPC"
  }
}
