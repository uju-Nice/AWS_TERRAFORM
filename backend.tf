terraform {
  backend "s3" {
    bucket         = "my-tf-state-prod"
    key            = "nickos/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

//terraform {
// backend "s3" {
//  bucket         = "your-state-bucket-name"
//  key            = "/terraform.tfstate-file-name"
//  region         = "us-east-1"
//  dynamodb_table = "terraform-locks"
//  encrypt        = true
//  }
//  }