variable "aws_region" {
  type = string
  description = "The AWS region to deploy resources in" 
}

# variable "vpc_cidr_range" {
#     type = string
#     description = "The CIDR block for the VPC"
# }

# variable "public_subnet_cidrs" {
#     type = list(string)     
# }

# variable "private_subnet_cidrs" {
#     type = list(string)         
# }

# variable "availability_zones" {
#     type = list(string)
# }

# variable "ami" {
#     type = string
#     description = "The AMI ID for the EC2 instance"
# }

# variable "instance_type" {
#     type = string
#     description = "The instance type for the EC2 instance"
# }

# variable "subnet_id" {
#     type = string
#     description = "The subnet ID where the EC2 instance will be launched"
# }

# variable "security_group" {
#     type = list(string)
#     description = "The security groups for the EC2 instance"
# }

# variable "vpc_id" {
#     type = string
#     description = "The VPC ID where the subnets will be created"
# }

# variable "bucket_name" {
#     type        = string   
#     description = "The name of the S3 bucket"     
# }

# variable "versioning_enabled" {
#     description = "Whether versioning is enabled for the S3 bucket"
#     type        = bool
# }

# variable "tags" {
#     description = "Tags for the S3 bucket"
#     type        = map(string)
# }
