# Instance
resource "aws_instance" "api_nodejs" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"

  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.api_nodejs_sg.id]

  tags = {
    Environment = "dev"
    Author      = "Bryan Solares"
    Email       = "solares.josue@outlook.com"
  }
}

# Security Group
resource "aws_security_group" "api_nodejs_sg" {
  name        = "allow_traffic_to_api_nodejs"
  description = "Allow traffic to api_nodejs"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3500
    to_port     = 3500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "dev"
    Author      = "Bryan Solares"
    Email       = "solares.josue@outlook.com"
  }
}

# SSH Key
resource "aws_key_pair" "api_nodejs_key" {
  key_name   = "api_nodejs_key"
  public_key = file("./keypair/api_nodejs_key.pub")

}

# ssh-keyget -t rsa -b 2048 -f "api_node_key"
