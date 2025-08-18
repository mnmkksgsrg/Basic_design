variable "vpc_name" {
  description = "VPCの名前"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "azs" {
  description = "使用するアベイラビリティゾーンのリスト"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "パブリックサブネットのCIDRブロックのリスト"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "プライベートサブネットのCIDRブロックのリスト"
  type        = list(string)
}

variable "ec2_ami_most_recent" {
  description = "EC2インスタンスで使用する最新のAMIを検索するかどうか"
  type        = bool
}

variable "ec2_ami_name_pattern" {
  description = "EC2インスタンスで使用するAMIの名前パターン"
  type        = string
}

variable "ec2_virtualization_type" {
  description = "EC2インスタンスの仮想化タイプ"
  type        = string
}

variable "ec2_ami_owners" {
  description = "EC2インスタンスで使用するAMIの所有者ID"
  type        = list(string)
}

variable "ec2_instance_type" {
  description = "EC2インスタンスのタイプ"
  type        = string
}

variable "ec2_name_tag" {
  description = "EC2インスタンスの名前タグ"
  type        = string
}

variable "ec2_associate_public_ip" {
  description = "EC2インスタンスにパブリックIPを関連付けるかどうか"
  type        = bool
}

variable "ec2_key_name" {
  description = "EC2インスタンスで使用するキーペアの名前"
  type        = string
}

variable "db_name" {
  description = "RDSインスタンスのデータベース名"
  type        = string
}

variable "db_username" {
  description = "RDSインスタンスのユーザー名"
  type        = string
}

variable "db_engine_version" {
  description = "RDSインスタンスのエンジンバージョン"
  type        = string
}

variable "db_instance_class" {
  description = "RDSインスタンスのクラス"
  type        = string
}

variable "db_allocated_storage" {
  description = "RDSインスタンスのストレージ容量（GB）"
  type        = number
}

variable "db_parameter_group_name" {
  description = "RDSインスタンスのパラメータグループ名"
  type        = string
}

variable "skip_final_snapshot" {
  description = "RDSインスタンス削除時にスナップショットをスキップするかどうか"
  type        = bool
}

variable "kms_key_id" {
  description = "RDSインスタンスで使用するKMSキーのID"
  type        = string
}

