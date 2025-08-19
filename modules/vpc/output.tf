output "vpc_id" {
  description = "VPCのID"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "VPCのCIDR"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "パブリックサブネットのID"
  value       = {
    for az, subnet in aws_subnet.public : az => subnet.id
  }
}

output "private_subnet_ids" {
  description = "プライベートサブネットのID"
  value       = [for s in aws_subnet.private : s.id]
}

output "internet_gateway_id" {
  description = "インターネットGWのID"
  value       = aws_internet_gateway.this.id
}

output "public_route_table_id" {
  description = "パブリックルートテーブルのID"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "プライベートルートテーブルのID"
  value       = aws_route_table.private.id
}

