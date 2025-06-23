# modules/ec2/main.tf

# Import existing SSH public key for EC2
resource "aws_key_pair" "generated_key" {
  # This resource will create a key pair in AWS if the public key file exists.
  # If you already have a key pair in AWS, you can use a data source instead:
  # data "aws_key_pair" "existing_key" { key_name = "your-key-name" }
  # Then use key_name = data.aws_key_pair.existing_key.key_name in aws_instance.main

  key_name   = "${var.project_name}-ec2-key"
  public_key = file(var.public_key_path)

  tags = {
    Name        = "${var.project_name}-ec2-key"
    Environment = "Dev"
  }
}

# Create EC2 Instance
resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true # Assign a public IP for direct SSH access
  vpc_security_group_ids      = [var.ec2_security_group_id]
  key_name                    = aws_key_pair.generated_key.key_name # Associate the SSH key pair

  tags = {
    Name        = "${var.project_name}-ec2-instance"
    Environment = "Dev"
  }

  # User data to install Nginx for a simple web server check
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Hello from ${var.project_name} EC2!</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF
}
