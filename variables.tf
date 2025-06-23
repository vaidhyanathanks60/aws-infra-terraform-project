# variables.tf (Root Module)

variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1" # Change to your desired AWS region
}

variable "project_name" {
  description = "A unique name for the project, used for resource tagging."
  type        = string
  default     = "MyWebApp"
}

# VPC Variables
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Ensure these AZs exist in your chosen region
}

# EC2 Variables
variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance (e.g., Amazon Linux 2 in us-east-1)."
  type        = string
  default     = "ami-053b0d53c279acc90" # This is a common Amazon Linux 2 AMI for us-east-1. Verify for your region.
}

variable "public_key_path" {
  description = "The path to your SSH public key (e.g., ~/.ssh/id_rsa.pub)."
  type        = string
  default     = "C:\\Users\\vaidh\\sshkey.pub" # IMPORTANT: Update this to your actual public key path
}

# RDS Variables
variable "db_instance_class" {
  description = "The instance type for the RDS database."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage in GB for the RDS database."
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine (e.g., postgres, mysql, aurora-postgresql)."
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The database engine version."
  type        = string
  default     = "14.7"
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
  default     = "myappdb"
}

variable "db_username" {
  description = "The username for the RDS master user."
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "The password for the RDS master user."
  type        = string
  default     = "ChangeMe123!" # IMPORTANT: Change this to a strong, secure password!
  sensitive   = true           # Mark as sensitive to prevent showing in logs
}
