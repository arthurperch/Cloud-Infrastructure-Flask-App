# Configure Terraform and required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Tell Terraform which cloud provider we're using (AWS)
provider "aws" {
  region = "us-west-2" # Oregon region (good + cheap)
}

# Create a Virtual Private Cloud (your own private network in AWS)
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "cloud-p1-vpc" }
}

# Create a public subnet (small slice of the VPC where servers can live)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = { Name = "cloud-p1-subnet-public" }
}

# Internet Gateway (lets your subnet talk to the internet)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "cloud-p1-igw" }
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "cloud-p1-rt-public" }
}

# Associate route table with public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group (like a firewall for your EC2 instance)
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main.id
  name   = "cloud-p1-ec2-sg"

  # Allow inbound traffic on port 80 (HTTP)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound SSH traffic on port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (so server can reach internet)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance (your small virtual server in AWS)
resource "aws_instance" "app" {
  ami           = "ami-024e4b8b6ef78434a" # Amazon Linux 2 image (free tier eligible)
  instance_type = "t3.micro"              # Free tier eligible
  key_name      = "Cloud-p1-key"          # SSH key pair for access
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = { Name = "cloud-p1-ec2" }
}
