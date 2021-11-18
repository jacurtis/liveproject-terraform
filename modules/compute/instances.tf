resource "aws_instance" "bastion" {
  for_each = var.public_subnets

  ami = data.aws_ami.amazon_linux.id
  instance_type = var.bastion_instance_type
  key_name = var.key_name
  subnet_id = each.value
  security_groups = [ var.bastion_sg_id ]

  tags = {
    "Name" = "${var.project_name} Bastion Host ${each.key}"
  }
}