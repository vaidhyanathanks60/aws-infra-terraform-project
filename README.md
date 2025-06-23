# aws-infra-terraform-project
To deploy a basic, three-tier cloud infrastructure on AWS using Terraform:
1.	VPC (Virtual Private Cloud):  isolated network.
2.	EC2 Instance (Elastic Compute Cloud): A virtual server (acting as a web server running Nginx).
3.	RDS Instance (Relational Database Service): A managed PostgreSQL database.
All these components will be organized using Terraform modules for better reusability and maintainability.
________________________________________
Understanding the Project Structure:

The project structure is:

aws-infra-terraform/
    main.tf             # Root: Defines AWS provider, calls modules.
    variables.tf        # Root: Declares input variables for the entire deployment.
    outputs.tf          # Root: Exports useful values from the deployment.
 modules/            # Directory for reusable Terraform modules.
     vpc/            # VPC Module: Creates networking components.
         main.tf     #   - VPC resources (VPC, subnets, IGW, NAT GW, Route Tables, Security Groups)
       variables.tf#   - Input variables for the VPC module.
         outputs.tf  #   - Outputs from the VPC module (e.g., VPC ID, subnet IDs, SG IDs).
    ec2/            # EC2 Module: Creates the EC2 instance.
         main.tf     #   - EC2 instance, Key Pair.
        variables.tf#   - Input variables for the EC2 module.
        outputs.tf  #   - Outputs from the EC2 module (e.g., public/private IP).
     rds/            # RDS Module: Creates the RDS database.
         main.tf     #   - RDS instance, DB Subnet Group.
         variables.tf#   - Input variables for the RDS module.
         outputs.tf  #   - Outputs from the RDS module (e.g., DB endpoint, username).

•	Root Level (aws-infra-terraform/): This is where you run your terraform commands. It acts as the orchestrator, telling Terraform which modules to use and how to connect their outputs as inputs.

•	modules/ Directory: Contains self-contained, reusable blocks of Terraform code. Each module focuses on a specific infrastructure component (VPC, EC2, RDS). This means you could, for instance, reuse the vpc module in a completely different Terraform project.
