# outputs.tf (Root Module)

output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.ec2.instance_public_ip
}

output "ec2_private_ip" {
  description = "The private IP address of the EC2 instance."
  value       = module.ec2.instance_private_ip
}

output "rds_endpoint" {
  description = "The endpoint of the RDS database instance."
  value       = module.rds.db_endpoint
}

output "rds_db_name" {
  description = "The name of the RDS database."
  value       = module.rds.db_name
}

output "rds_username" {
  description = "The master username for the RDS database."
  value       = module.rds.db_username
}
