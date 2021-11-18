output "amazon_linux_ami_id" {
  description = "The Amazon Linux AMI used on our instances"
  value = data.aws_ami.amazon_linux.id
}