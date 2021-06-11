resource "aws_security_group" "ec2_infra_sg_public" {
    name        = "ec2_infra_sg_public"
    description = "security group applied to public ec2"
    vpc_id      = aws_vpc.vpc_ec2_infra.id

    ingress {
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks     = ["::/0"]
    }

   ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks     = ["::/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks     = ["::/0"]
    }

    tags = {
        Name = "ec2_infra_sg_public"
    }
}

resource "aws_security_group" "ec2_infra_sg_private" {
    name        = "ec2_infra_sg_private"
    description = "security group applied to private ec2"
    vpc_id      = aws_vpc.vpc_ec2_infra.id

    ingress {
        description      = "SSH from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = [aws_vpc.vpc_ec2_infra.cidr_block]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks     = ["::/0"]
    }

    tags = {
        Name =  "ec2_infra_sg_private"
    }
}

