resource "aws_eip" "public" {
  for_each = var.public_subnet_cidr_blocks

  vpc = true

  tags = {
    Name = "${var.project_name} EIP - ${each.key}"
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "public" {
  for_each = var.public_subnet_cidr_blocks
  # Public by default

  allocation_id = aws_eip.public[each.key].id
  subnet_id = aws_subnet.public[each.key].id

  tags = {
    Name = "${var.project_name} NAT-GW ${each.key}"
  }

  depends_on = [aws_internet_gateway.igw]
}