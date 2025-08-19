output "instance_id" {
  description = "EC2インスタンスID"
  value       = aws_instance.wordpress.id
}

output "instance_arn" {
  description = "EC2インスタンスARN"
  value       = aws_instance.wordpress.arn
}

output "private_ip" {
  description = "プライベートIPアドレス"
  value       = aws_instance.wordpress.private_ip
}

output "public_ip" {
  description = "パブリックIPアドレス"
  value       = aws_instance.wordpress.public_ip
}

output "availability_zone" {
  description = "アベイラビリティゾーン"
  value       = aws_instance.wordpress.availability_zone
}

output "ami_id" {
  description = "使用AMIのID"
  value       = data.aws_ami.ubuntu.id
}

