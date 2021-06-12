# IAC using Terraform

This repo contain following 
  - Terraform script to create infra in AWS like vpc, subnets,EC2 etc.
  - These EC2 machines are configured and provisioned with required software using userdata.


## 1. Install all required dependencies
- Login as root (sudo su -)
- clone the repo: git clone https://github.com/mrinmoymena/terraform_iac_ec2.git
- Setup AWS credentials file on Linux machine (~/.aws/credentials)
- Sample content:
     
     [default]
     
     aws_access_key_id=
     
     aws_secret_access_key=
- Install following dependencies by running dependencies.sh
    
    ./dependencies.sh

## 2. Create infra and Install application

    run following command to create vpc, subnets, EC2 etc. 
   
    - terraform init
    - terraform apply #User is asked to pass existing key pair name
- State file is managed in local machine which can be maintained in S3 as per environment using workspace
- After passing key pair all required resources will be created
- ec2_jenkins EC2 is created in public subnet
- ec2_client EC2 is created in private subnet 
