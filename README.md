# This is for terraform_training documentation    
Download Terraform binarires on OS which installs Terraform CLI.
https://www.terraform.io/downloads
Download AWS CLI 
Log into aws console and Create I AM User from the "ROOT USER" and generate aws access key and secret access credentias and save them on your machine.
Authenticate the Terraform with AWS provider with these environemnt variables: 
export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
export AWS_DEFAULT_REGION="<YOUR_AWS_DEFAULT_REGION>"

or use 
aws configure 


Install terraform on  Linux CLI:                                                                                             curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
           sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
          sudo apt-get update && sudo apt-get install terraform sudo apt-get update && sudo apt-get install terraform

Terraform commands:
terraform version 
terraform init - intilaizes the backend configuration 
terraform plan -
terraform apply - 
terraform taint - would mark a resource to be recreated during terraform apply
terraform untaint - discard the taint state of a resource 
terraform destroy - 
terraform fmt
terraform validate
terraform show
terraform refresh
terraform import
terraform state list - all the resources in the state file are listed
terraform state show - shows an information about a created resource
terraform workspace list - All workspace in the curent working diretory are listed
terraform workspace new <the-new-workspace-name> - creates a new workspace 



Deplying resources baased on specific environment using cli with -var-file

FOR DEV ENV
terraform plan -var-file=envs/development/dev.tfvars
terraform apply -var-file=envs/development/dev.tfvars

FOR STAGING ENV
terraform plan -var-file=envs/staging/staging.tfvars
terraform apply -var-file=envs/staging/staging.tfvars

FOR PROD ENV
terraform plan -var-file=envs/production/prod.tfvars
terraform apply -var-file=envs/production/prod.tfvars

 source = "github.com/orgName/repoName"  // from a github where repo with a specific terraform version

TERRAFORM FUNCTION
join(",", ["window", "mac", "linux"])   =>  "window, mac, linux"
join(",", "window, mac, linux")         =>  ["window", "mac", "linux"]
length(["one", "two", "three"])         =>   3