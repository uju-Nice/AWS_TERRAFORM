module "vpc" {
  //source = "./modules/vpc"
 // source = "terraform-aws-modules/vpc/aws"
 source = "git::https://github.com/uju-Nice/TERRAFORM-MODULES.git//modules/vpc?ref=v1.0.0" 
 cidr_block = var.cidr_block
 public_subnet_cidrs = var.public_subnet_cidrs
 private_subnet_cidrs = var.private_subnet_cidrs  

}

module "ec2" {
  //source    = "./modules/ec2"
 // source = "terraform-aws-modules/ec2/aws"
  source = "git::https://github.com/uju-Nice/TERRAFORM-MODULES.git//modules/vpc?ref=v1.0.0"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_id   = module.vpc.vpc_id 
 
}

module "s3" {
  //source = "./modules/s3"
  //source = "terraform-aws-modules/s3/aws"
source = "git::https://github.com/uju-Nice/TERRAFORM-MODULES.git//modules/vpc?ref=v1.0.0"
  bucket_name = var.bucket_name
  versioning_enabled = var.versioning_enabled
  tags = var.tags
} 

