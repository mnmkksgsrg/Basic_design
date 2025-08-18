output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.wordpress.id
}

output "instance_arn" {
  description = "EC2 instance ARN"
  value       = aws_instance.wordpress.arn
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.wordpress.private_ip
}

output "public_ip" {
  description = "Public IP address (null if no public IP)"
  value       = aws_instance.wordpress.public_ip
}

output "availability_zone" {
  description = "Instance Availability Zone"
  value       = aws_instance.wordpress.availability_zone
}

output "ami_id" {
  description = "AMI ID used by the instance"
  value       = data.aws_ami.ubuntu.id
}

