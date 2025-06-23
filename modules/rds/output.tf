# modules/rds/outputs.tf

output "db_endpoint" {
  description = "The connection endpoint for the RDS database instance."
  value       = aws_db_instance.main.address
}

output "db_name" {
  description = "The name of the database created."
  value       = aws_db_instance.main.db_name
}

output "db_username" {
  description = "The master username for the RDS database."
  value       = aws_db_instance.main.username
}
