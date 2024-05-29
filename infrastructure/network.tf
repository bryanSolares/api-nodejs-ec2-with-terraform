# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "172.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Environment = "dev"
    Author      = "Bryan Solares"
    Email       = "solares.josue@outlook.com"
  }

}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.0.1.0/24"
  map_public_ip_on_launch = true


  tags = {
    Environment = "dev"
    Author      = "Bryan Solares"
    Email       = "solares.josue@outlook.com"
  }
}

# Table association
resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public-route-table.id
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Environment = "dev"
    Author      = "Bryan Solares"
    Email       = "solares.josue@outlook.com"
  }
}

# Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
