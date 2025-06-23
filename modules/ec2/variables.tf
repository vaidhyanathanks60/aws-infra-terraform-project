# modules/ec2/variables.tf

variable "project_name" {
  description = "A unique name for the project, used for resource tagging."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet to deploy the EC2 instance into."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be deployed."
  type        = string
}

variable "ec2_security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance."
  type        = string
}

variable "public_key_path" {
  description = "The path to your SSH public key (e.g., ~/.ssh/id_rsa.pub)."
  type        = string
}
