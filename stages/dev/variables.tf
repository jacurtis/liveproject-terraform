variable "region" {
  type = string
  default = "us-west-2"
}

variable "profile" {
  type = string
  default = "default"
}

variable "project_name" {
  type = string
}

variable "ssh_key" {
  type = string
  description = "The SSH Key value to use for logging into instances"
}