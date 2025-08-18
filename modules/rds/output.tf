output "db_instance_id" {
  description = "RDSインスタンスID"
  value       = aws_db_instance.rds.id
}

output "db_endpoint" {
  description = "接続エンドポイント（host:port）"
  value       = aws_db_instance.rds.endpoint
}

output "db_address" {
  description = "DBのホスト名（DNS）"
  value       = aws_db_instance.rds.address
}

output "db_port" {
  description = "DBのポート"
  value       = aws_db_instance.rds.port
}

output "db_engine_version_actual" {
  description = "実際に稼働中のエンジンバージョン（自動マイナー更新後の実値）"
  value       = aws_db_instance.rds.engine_version_actual
}

output "db_subnet_group_name" {
  description = "DB Subnet Group 名"
  value       = aws_db_subnet_group.this.name
}

output "db_security_group_id" {
  description = "RDS用セキュリティグループID"
  value       = aws_security_group.allow_rds_traffic.id
}

# manage_master_user_password = true を使っている場合に便利（Secrets ManagerのARN）
output "master_user_secret_arn" {
  description = "RDSマスターユーザーのシークレットARN（manage_master_user_password=true時）"
  value       = aws_db_instance.rds.master_user_secret[0].secret_arn
  sensitive   = true
}

