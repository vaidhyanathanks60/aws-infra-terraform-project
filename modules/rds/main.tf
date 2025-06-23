# modules/rds/main.tf

# Create DB Subnet Group (for private subnets)
resource "aws_db_subnet_group" "main" {
  name       = "${lower(var.project_name)}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-rds-subnet-group"
    Environment = "Dev"
  }
}

# Create RDS Instance
resource "aws_db_instance" "main" {
  allocated_storage      = var.db_allocated_storage
  engine                 = var.db_engine
  engine_version         = "17"
  instance_class         = var.db_instance_class
  identifier             = "db-${lower(replace(var.project_name, "_", "-"))}"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_security_group_id] # Use the RDS security group from VPC module
  skip_final_snapshot    = true                       # Set to false for production
  publicly_accessible    = false                      # Ensure it's not publicly accessible

  tags = {
    Name        = "${var.project_name}-rds-instance"
    Environment = "Dev"
  }
}
