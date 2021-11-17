resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.primary.id

  tags = {
    Name = "${var.project_name} IGW"
  }
}