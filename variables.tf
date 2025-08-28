###VPC###

variable "vpc_name" {
  description = "VPC名"
  type        = string
  default     = "basic_vpc"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
  default     = "10.0.0.0/16"
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


###EC2###

variable "ec2_name" {
  description = "EC2インスタンス名"
  type        = string
  default     = "basic_ec2"
}


###RDS###

variable "db_name" {
  description = "RDSインスタンスのデータベース名"
  type        = string
  default     = "basic_rds"
}

variable "db_username" {
  description = "RDSインスタンスのユーザー名"
  type        = string
  default     = "mnmkksgsrg"
}

variable "db_password" {
  description = "RDSインスタンスのマスターパスワード"
  type        = string
  sensitive   = true
}

