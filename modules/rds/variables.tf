# modules/rds/variables.tf

variable "project_name" {
  description = "A unique name for the project, used for resource tagging."
  type        = string
}

variable "db_instance_class" {
  description = "The instance type for the RDS database."
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in GB for the RDS database."
  type        = number
}

variable "db_engine" {
  description = "The database engine (e.g., postgres, mysql, aurora-postgresql)."
  type        = string
}

variable "db_engine_version" {
  description = "The database engine version."
  type        = string
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "db_username" {
  description = "The username for the RDS master user."
  type        = string
}

variable "db_password" {
  description = "The password for the RDS master user."
  type        = string
  sensitive   = true # Mark as sensitive
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the RDS subnet group."
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be deployed."
  type        = string
}

variable "rds_security_group_id" {
  description = "The ID of the security group to associate with the RDS instance."
  type        = string
}
