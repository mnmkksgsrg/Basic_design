variable "ami_most_recent" {
  description = "最新のamiを使用するか"
  type        = bool
  default     = true
}

variable "ami_name_pattern" {
  description = "AMIの名前パターン"
  type        = string
  default     = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "ami_virtualization_type" {
  description = "AMIの仮想化タイプ"
  type        = string
  default     = "hvm"
}

variable "ami_owners" {
  description = "AMIのownerID"
  type        = list(string)
  default     = ["amazon"]
}

variable "instance_type" {
  description = "インスタンスタイプ"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2インスタンスで使用するキーペア名"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "EC2を配置するサブネットID"
  type        = string
}

variable "security_group_ids" {
  description = "EC2インスタンスに付与するセキュリティグループID"
  type        = list(string)
  default     = []
}

variable "ec2_name" {
  description = "EC2インスタンス名"
  type        = string
}

