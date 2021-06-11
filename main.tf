provider "aws" {
  region  = "ap-south-1"
  shared_credentials_file 	= "~/.aws/credentials"
  profile                	= "default"
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}
