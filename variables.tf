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

variable "ec2_ami_most_recent" {
  description = "EC2インスタンスで使用する最新のAMIを検索するかどうか"
  type        = bool
  default     = true
}

variable "ec2_ami_name_pattern" {
  description = "EC2インスタンスで使用するAMIの名前パターン"
  type        = string
  default     = "al2023-ami-*-x86_64"
}

variable "ec2_virtualization_type" {
  description = "EC2インスタンスの仮想化タイプ"
  type        = string
  default     = "hvm"
}

variable "ec2_ami_owners" {
  description = "EC2インスタンスで使用するAMIの所有者ID"
  type        = list(string)
  default     = ["137112412989"]
}

variable "ec2_instance_type" {
  description = "EC2インスタンスのタイプ"
  type        = string
  default     = "t3.micro"
}

variable "ec2_name" {
  description = "EC2インスタンス名"
  type        = string
  default     = "basic_ec2"
}

variable "ec2_associate_public_ip" {
  description = "EC2インスタンスにパブリックIPを関連付けるかどうか"
  type        = bool
  default     = true
}

variable "ec2_key_name" {
  description = "EC2インスタンスで使用するキーペアの名前"
  type        = string
  default     = null
}

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

variable "db_engine_version" {
  description = "RDSインスタンスのエンジンバージョン"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDSインスタンスのクラス"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDSインスタンスのストレージ容量（GB）"
  type        = number
  default     = 20
}

variable "db_parameter_group_name" {
  description = "RDSインスタンスのパラメータグループ名"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "RDSインスタンス削除時にスナップショットをスキップ"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "RDSインスタンスで使用するKMSキーのID"
  type        = string
  default     = null
}

