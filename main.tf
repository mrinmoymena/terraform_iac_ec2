provider "aws" {
  region  = var.region
  shared_credentials_file 	= var.shared_credentials_file
  profile                	= var.profile
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}
