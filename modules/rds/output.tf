output "db_instance_id" {
  description = "RDSインスタンスID"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "接続エンドポイント（host:port）"
  value       = aws_db_instance.this.endpoint
}

output "db_address" {
  description = "DBのホスト名（DNS）"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "DBのポート番号"
  value       = aws_db_instance.this.port
}

output "db_engine_version_actual" {
  description = "実際に稼働中のエンジンバージョン"
  value       = aws_db_instance.this.engine_version_actual
}

output "db_subnet_group_name" {
  description = "DB Subnet Group 名"
  value       = aws_db_subnet_group.this.name
}

