# # Configure the AWS Provider
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "eu-west-2" 
# }

# ------------------------------
# 1. VPC
# ------------------------------
resource "aws_vpc" "nickos_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "nickos_vpc"
  }
}

# ------------------------------
# 2. Subnet
# ------------------------------
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.nickos_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true # So EC2 gets public IP

  tags = {
    Name = "nickos_public_subnet"
  }
}

# ------------------------------
# 3. Internet Gateway
# ------------------------------
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.nickos_vpc.id

  tags = {
    Name = "nickos_igw"
  }
}

# ------------------------------
# 4. Route Table
# ------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.nickos_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "nickos_route_table"
  }
}

# Associate subnet with route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

# ------------------------------
# 5. Security Group
# ------------------------------
resource "aws_security_group" "nickos_web_sg" {
  name        = "nickos_web_sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.nickos_vpc.id

  # Inbound
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to your IP in production!
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nickos_web_sg"
  }
}

# ------------------------------
# 6. EC2 Instance
# ------------------------------
resource "aws_instance" "nickos_server" {
  ami           = "ami-0d114020bf27f27cf" # Ubuntu 20.04 LTS (eu-west-2)
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.nickos_web_sg.id]

  tags = {
    Name = "nickos_server"
  }
}

# 7. S3 Bucket
# ------------------------------
resource "aws_s3_bucket" "nickos-bucket" {
  bucket = "nickos-bucket" 

  tags = {
    Name        = "nickos-bucket"
    Environment = "Dev"
  }
}

# ------------------------------
# Outputs
# ------------------------------
output "nickos_vpc_id" {
  value = aws_vpc.nickos_vpc.id
}

output "nickos_ec2_public_ip" {
  value = aws_instance.nickos_server.public_ip
}

output "nickos_s3_bucket_name" {
  value = aws_s3_bucket.nickos-bucket.bucket
}