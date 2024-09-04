
resource "aws_vpc" "nickos_vpc" {
  cidr_block = var.devops_vpc
}

resource "aws_subnet" "nickos_subnet" {
  vpc_id           = "aws_vpc.nickos_vpc.id"
  cidr_block       = var.devops_subnet
}


# module "vpc" {
#   # source = "./vpc"  // from a local path
#   # source = "github.com/uju-Nice/AWS_TERRAFORM.git"  // from a github where you have the terraform repo
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "4.3.0"
# }