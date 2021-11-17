# Public Route linked to our IGW
resource "aws_route_table" "public_to_igw" {
  vpc_id = aws_vpc.primary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name} RT Public"
  }
}

# Associate Public Route with each public subnet
resource "aws_route_table_association" "public" {
  for_each = var.public_subnet_cidr_blocks
  
  route_table_id = aws_route_table.public_to_igw.id
  subnet_id = aws_subnet.public[each.key].id
}

# Private Route linked to Each NAT GW
resource "aws_route_table" "private_to_natgw" {
  for_each = var.private_app_subnet_cidr_blocks

  vpc_id = aws_vpc.primary.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public[each.key].id
  }

  tags = {
    Name = "${var.project_name} RT Private ${each.key}"
  }
}

# Associate each Private Route with Each Private Subnet (DB and App for each AZ)
resource "aws_route_table_association" "private_app" {
  for_each = var.private_app_subnet_cidr_blocks

  route_table_id = aws_route_table.private_to_natgw[each.key].id
  subnet_id = aws_subnet.private_app[each.key].id
}

resource "aws_route_table_association" "private_db" {
  for_each = var.private_db_subnet_cidr_blocks

  route_table_id = aws_route_table.private_to_natgw[each.key].id
  subnet_id = aws_subnet.private_db[each.key].id
}