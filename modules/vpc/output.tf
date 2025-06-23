# modules/vpc/outputs.tf

output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "ec2_security_group_id" {
  description = "The ID of the security group for EC2 instances."
  value       = aws_security_group.ec2_sg.id
}

output "rds_security_group_id" {
  description = "The ID of the security group for RDS instances."
  value       = aws_security_group.rds_sg.id
}
