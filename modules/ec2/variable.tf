variable "ami" {
    type = string
    default = "ami-00a929b66ed6e0de6"
}

variable "instance_type" {
    type = string  
}

variable "subnet_id" {
    type = string
}

variable "security_group" {
    type = list(string)
}

variable "vpc_id" {
    type = string
}

