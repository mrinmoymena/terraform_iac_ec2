resource "aws_subnet" "ec2_infra_sn_public" {
  availability_zone       = data.aws_availability_zones.available.names[0]
  cidr_block              = "172.20.10.0/24"
  vpc_id                  = aws_vpc.vpc_ec2_infra.id
  map_public_ip_on_launch = true
  tags = {
    Name = "ec2-infra-sn-public"
  }
}

resource "aws_subnet" "ec2_infra_sn_private" {
  availability_zone       = data.aws_availability_zones.available.names[1]
  cidr_block              = "172.20.20.0/24"
  vpc_id                  = aws_vpc.vpc_ec2_infra.id
  map_public_ip_on_launch = false
  tags = {
    Name = "ec2-infra-sn-private"
  }
}


resource "aws_internet_gateway" "ec2_infra_ig" {
  vpc_id = aws_vpc.vpc_ec2_infra.id

  tags = {
    Name = "eks_demo_ig"
  }
}

resource "aws_route_table" "ec2_infra_route_table" {
  vpc_id = aws_vpc.vpc_ec2_infra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2_infra_ig.id
  }
}

resource "aws_route_table_association" "ec2_infra_route_table_asso" {
  count = 2

  subnet_id      = aws_subnet.ec2_infra_sn_public.id
  route_table_id = aws_route_table.ec2_infra_route_table.id
}
