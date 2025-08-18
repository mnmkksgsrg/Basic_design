variable "db_name" {
  description = "RDSデータベース名"
  type        = string
  default     = "may_db"
}

variable "db_subnet_ids" {
  description = "RDSを配置するプライベートサブネットIDリスト"
  type        = list(string)
}

variable "allocated_storage" {
  description = "RDSインスタンスのストレージサイズ"
  type        = number
  default     = 20
}

variable "instance_class" {
  description = "RDSインスタンスのクラス"
  type        = string
  default     = "db.t3.micro"
}

variable "engine_version" {
  description = "データベースエンジンのバージョン"
  type        = string
  default     = "8.0"
}

variable "username" {
  description = "マスターユーザー名"
  type        = string
  default     = "admin"
}

variable "vpc_id" {
  description = "RDSを作成するVPCのID"
  type        = string
}

variable "allowed_app_sg_ids" {
  description = "RDSへのアクセスを許可するアプリ側SGのIDリスト"
  type        = list(string)
  default     = []
}

