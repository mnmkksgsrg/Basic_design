output "web_security_group_id" {
  description = "Web用セキュリティグループのID"
  value       = aws_security_group.web.id
}

output "web_security_group_arn" {
  description = "Web用セキュリティグループのARN"
  value       = aws_security_group.web.arn
}

output "web_security_group_name" {
  description = "Web用セキュリティグループのNameタグ"
  value       = try(aws_security_group.web.tags.Name, null)
}

output "rds_security_group_id" {
  description = "RDS用セキュリティグループのID"
  value       = aws_security_group.rds.id
}

output "rds_security_group_arn" {
  description = "RDS用セキュリティグループのARN"
  value       = aws_security_group.rds.arn
}

output "rds_security_group_name" {
  description = "RDSセキュリティグループのNameタグ"
  value       = try(aws_security_group.rds.tags.Name, null)
}