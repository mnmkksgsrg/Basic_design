variable "vpc_name" {
  description = "VPC名"
  type = string
  default = "default_vpc"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type = string
}

variable "public_subnets" {
  description = "パブリックサブネットのマップ"
  type = map(object({ cidr_block = string }))
  default = {}
}

variable "private_subnets" {
  description = "プライベートサブネットのマップ"
  type = map(object({ cidr_block = string }))
  default = {}
}

