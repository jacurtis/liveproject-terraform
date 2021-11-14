variable "project_name" {
  type = string
  description = "The project name, used to build other names"
  default = "Liveproject"
}

variable "vpc_cidr_block" {
  type = string
  description = "The CIDR block that should be used for the full VPC. Note that all subnet CIDRs need to fit within this CIDR. Defaults to 172.16.0.0/16"
  default = "172.16.0.0/16"
}

variable "availability_zones" {
  type = list(string)
  default = [ 
    "us-west-2a",
    "us-west-2b",
    "us-west-2c",
  ]
}

variable "public_subnet_cidr_blocks" {
  type = map(string)
  description = "The CIDR Blocks to use for public subnets"
  default = { 
    "A" = "172.16.1.0/24" 
    "B" = "172.16.2.0/24" 
    "C" = "172.16.3.0/24" 
  }
}

variable "private_app_subnet_cidr_blocks" {
  type = map(string)
  description = "The CIDR Blocks to use for private app subnets"
  default = { 
    "A" = "172.16.4.0/24" 
    "B" = "172.16.5.0/24" 
    "C" = "172.16.6.0/24" 
  }
}

variable "private_db_subnet_cidr_blocks" {
  type = map(string)
  description = "The CIDR Blocks to use for private db subnets"
  default = { 
    "A" = "172.16.8.0/24" 
    "B" = "172.16.9.0/24" 
    "C" = "172.16.10.0/24" 
  }
}