resource "aws_key_pair" "primary" {
  key_name = "${var.project_name}-Key"
  public_key = var.ssh_key
}
