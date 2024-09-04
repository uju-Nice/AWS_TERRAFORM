
terraform {
  # backend "s3" {
  #   bucket         = "nickos_bucket"
  #   key            = "envs/dev/dev.tfstate"
  #   region         = "eu-west-2"
  #   dynamodb_table = "nickos.tfstate_lock"
  # }

# provider for terraform 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# provider for aws
provider "aws" {
  region  = "us-west-2"
}
