output "bastion_sg_id" {
  value = aws_security_group.bastion_host.id
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "key_pair" {
  value = aws_key_pair.primary
}