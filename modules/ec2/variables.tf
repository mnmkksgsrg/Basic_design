variable "ami_most_recent" {
  description = "最新のamiを使用するか"
  type        = bool
  default     = true
}

variable "ami_name_pattern" {
  description = "AMIの名前パターン"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "ami_virtualization_type" {
  description = "AMIの仮想化タイプ"
  type        = string
  default     = "hvm"
}

variable "ami_owners" {
  description = "ownerのID"
  type        = list(string)
  default     = ["099720109477"]
}

variable "instance_type" {
  description = "インスタンスタイプ"
  type        = string
  default     = "t3.micro"
}







