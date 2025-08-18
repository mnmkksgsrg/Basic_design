variable "vpc_name" {
  description = "VPC名"
  type = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type = string
}

variable "public_subnet_cidr" {
  description = "パブリックサブネットのCIDRブロック"
  type = string
}

variable "private_subnet_cidrs" {
  description = "プライベートサブネットのCIDRブロック"
  type = list(string)
}

variable "azs" {
  description = "AZのリスト"
  type = list(string)
}

