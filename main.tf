# main.tf (Root Module)

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Ensure you use a recent version for full feature support
    }
  }
  required_version = ">= 1.0" # Specify minimum Terraform CLI version
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# ----------------------------------------------------------
# VPC Module Call
# ----------------------------------------------------------
module "vpc" {
  source = "./modules/vpc" # Path to the VPC module

  project_name      = var.project_name
  vpc_cidr_block    = var.vpc_cidr_block
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  availability_zones = var.availability_zones
}

# ----------------------------------------------------------
# EC2 Module Call
# ----------------------------------------------------------
module "ec2" {
  source = "./modules/ec2" # Path to the EC2 module

  project_name      = var.project_name
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  public_subnet_id  = module.vpc.public_subnet_ids[0] # Using the first public subnet from the VPC module
  vpc_id            = module.vpc.vpc_id
  public_key_path   = var.public_key_path
  ec2_security_group_id = module.vpc.ec2_security_group_id # Pass SG ID from VPC module
}

# ----------------------------------------------------------
# RDS Module Call
# ----------------------------------------------------------
module "rds" {
  source = "./modules/rds" # Path to the RDS module

  project_name         = var.project_name
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password # Sensitive variable, handle with care (e.g., Terraform Cloud, Vault)
  private_subnet_ids   = module.vpc.private_subnet_ids # Using private subnets from the VPC module
  vpc_id               = module.vpc.vpc_id
  rds_security_group_id = module.vpc.rds_security_group_id # Pass SG ID from VPC module
}
