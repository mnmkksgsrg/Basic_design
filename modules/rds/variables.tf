variable "name" {
  description = "RDS名のプレフィックス"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "db_subnet_ids" {
  description = "RDSを配置するプライベートサブネットIDリスト"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "RDSに付与する追加セキュリティグループID"
  type        = list(string)
  default = []
}

variable "db_name" {
  description = "RDSデータベース名"
  type        = string
}

variable "db_username" {
  description = "RDSユーザー名"
  type        = string
}

variable "db_password" {
  description = "RDSマスターパスワード"
  type        = string
  sensitive   = true
}

variable "engine" {
  description = "RDSエンジン"
  type        = string
  default = "mysql"
}

variable "engine_version" {
  description = "RDSエンジンバージョン"
  type        = string
  default = "8.0"
}

variable "allocated_storage" {
  description = "ストレージサイズ(GB)"
  type        = number
}

variable "storage_type" {
  description = "ストレージタイプ"
  type        = string
  default = "gp2"
}

variable "instance_class" {
  description = "インスタンスクラス"
  type        = string
}

variable "multi_az" {
  description = "マルチAZ"
  type        = bool
  default = false
}

variable "publicly_accessible" {
  description = "パブリックアクセス可否"
  type        = bool
  default = false
}

variable "backup_retention_period" {
  description = "バックアップ保持日数"
  type        = number
  default = 7
}

variable "skip_final_snapshot" {
  description = "削除時に最終スナップショットをスキップ"
  type        = bool
  default = true
}

variable "deletion_protection" {
  description = "削除保護"
  type        = bool
  default = false
}

variable "storage_encrypted" {
  description = "ストレージ暗号化"
  type        = bool
  default = false
}

variable "kms_key_id" {
  description = "KMSキーID"
  type        = string
}

variable "enable_performance_insights" {
  description = "パフォーマンス情報"
  type        = bool
  default = false
}

variable "db_parameter_group_name" {
  description = "DBパラメータグループ名"
  type        = string
}

variable "tags" {
  description = "共通タグ"
  type        = map(string)
}

