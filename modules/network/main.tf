resource "aws_vpc" "primary" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.project_name} VPC"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidr_blocks

  vpc_id = aws_vpc.primary.id
  cidr_block = each.value
  availability_zone = var.availability_zones[index(keys(var.public_subnet_cidr_blocks), each.key)]

  tags = {
    "Name" = "${var.project_name} Public ${each.key}"
  }
}

resource "aws_subnet" "private_app" {
  for_each = var.private_app_subnet_cidr_blocks

  vpc_id = aws_vpc.primary.id
  cidr_block = each.value
  availability_zone = var.availability_zones[index(keys(var.private_app_subnet_cidr_blocks), each.key)]

  tags = {
    "Name" = "${var.project_name} Private App ${each.key}"
  }
  
}

resource "aws_subnet" "private_db" {
  for_each = var.private_db_subnet_cidr_blocks

  vpc_id = aws_vpc.primary.id
  cidr_block = each.value
  availability_zone = var.availability_zones[index(keys(var.private_db_subnet_cidr_blocks), each.key)]

  tags = {
    "Name" = "${var.project_name} Private DB ${each.key}"
  }
}