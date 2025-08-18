output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

# もし route table を public/private で分けない設計なら、この1つだけでもOK
output "route_table_id" {
  description = "Route table ID"
  value       = aws_route_table.this.id
}

output "web_security_group_id" {
  description = "Allow web (HTTP/HTTPS) SG"
  value       = aws_security_group.allow_web_traffic.id
}

