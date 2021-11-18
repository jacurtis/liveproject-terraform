variable "project_name" {
  description = "Project name used to namespace resource names"
  type = string
  default = "Liveproject"
}

variable "ssh_key" {
  type = string
  description = "The SSH Public key used for logging into EC2 Instances"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID that you want to deploy into"
}

