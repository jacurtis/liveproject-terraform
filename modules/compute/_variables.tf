data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm*" ]
  }
}

variable "project_name" {
  description = "Project name used to namespace resource names"
  type = string
  default = "Liveproject"
}

variable "bastion_sg_id" {
  description = "The Security Group to assign to Bastion Hosts"
  type = string
}

variable "app_sg_id" {
  description = "The Security Group to assign to App Hosts"
}

variable "bastion_instance_type" {
  description = "The Instance Type to use for Bastion Hosts"
  type = string
  default = "t2.micro"
}

variable "app_instance_type" {
  description = "The Instance Type to use for Bastion Hosts"
  type = string
  default = "t2.micro"
}

variable "public_subnets" {
  type = map(string)
}

variable "private_app_subnets" {
  type = map(string)
}

variable "key_name" {
  type = string
}