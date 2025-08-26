variable "vpc_name" {
  description = "VPC名"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "public_subnets" {
  description = "パブリックサブネットのCIDRとAZ"
  type        = map(object({ cidr_block = string }))
  default     = {}
}

variable "private_subnets" {
  description = "プライベートサブネットのCIDRとAZ"
  type        = map(object({ cidr_block = string }))
  default     = {}
}

