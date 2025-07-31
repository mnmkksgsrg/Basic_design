variables "vpc_name" {
  description = "VPC名"
  type = string
}

variables "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type = string
}

variables "public_subnet_cidr" {
  description = "パブリックサブネットのCIDRブロック"
  type = string
}

variables "private_subnet_cidr" {
  description = "プライベートサブネットのCIDRブロック"
  type = string
}
