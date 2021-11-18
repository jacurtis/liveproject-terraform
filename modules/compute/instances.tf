resource "aws_instance" "bastion" {
  for_each = var.public_subnets

  ami = data.aws_ami.amazon_linux.id
  instance_type = var.bastion_instance_type
  key_name = var.key_name
  subnet_id = each.value
  vpc_security_group_ids = [ var.bastion_sg_id ]

  tags = {
    "Name" = "${var.project_name} Bastion Host ${each.key}"
  }
}

resource "aws_instance" "app" {
  for_each = var.private_app_subnets

  ami = data.aws_ami.amazon_linux.id
  instance_type = var.app_instance_type
  key_name = var.key_name
  subnet_id = each.value
  vpc_security_group_ids = [ var.app_sg_id ]

  tags = {
    Name = "${var.project_name} App Host ${each.key}"
  }
}