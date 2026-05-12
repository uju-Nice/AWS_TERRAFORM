variable "cidr_block" {
    type = string
      description = "CIDR block for VPC" 
}

variable "public_subnet_cidrs" {
    type = list(string)
    description = "cidr range for public subnets"
}

variable "private_subnet_cidrs" {
    type = list(string)
    description = "cidr range for private subnets"
}

variable "availability_zones" {
    type = list(string)
    description = "Availability zones for the VPC"
}
