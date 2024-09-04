variable "devops_vpc" {
  type = string 
  description = "Vpc being created in my account"
  default =  "10.2.0.0/16"
}

variable "devops_subnet" {
  type = string 
  description = "Subnet being created in my account"
  default = "10.1.0.0/24"
}

variable "instance_name" {
  type = string 
  description = "EC2 name being created for the instance"
  default = "nickos_ec2"
}

variable "instance_type" {
  type = string 
  description = "EC2 type being created in my account"
  default = "t3.micro"
}

variable "ami" {
  type = string 
  description = "Ami type being created with the ec2"
  default = "ami-090abff6ae1141d7d"
}

variable "region" {
   type = string 
  description = "The region where resources will be deplopyed"
  default = "ami-090abff6ae1141d7d"
}

variable "availability_zones" {
   type = string 
  description = "The availabilty zones inside the region"
  default = "eu-west-2a"
}