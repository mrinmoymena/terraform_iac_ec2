resource "aws_vpc" "vpc_ec2_infra" {
    cidr_block           = "172.20.0.0/16"
    enable_dns_hostnames = false
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags = {
        Name = "ec2-infra"
    }
}
