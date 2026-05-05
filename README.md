Download terraform (https://developer.hashicorp.com/terraform/install#windows)
step 1: open your system environemnt variables, click on edit and browse for the location of the terraform and edit and okay on all. 

download AWS CLI version 2   (aws --version)

https://developer.hashicorp.com/terraform/tutorials/aws-get-started

Provision and deploy Infrastructure in aws cloud
N/B:Use the below options to Authenticate to aws by setting up aws secret key and access key with 
a. export ENVIRONEMENT_VARIABLE ( for testing purposes ONLY in the CLI, Not recomended)


Call any module you want using the tag version as ref instead of repeating it.

REPO - environments folder ( dev.tfvars, staging.tfvars, production.tfvars )
REPO - (main.tf, variable.tf, output.tf, provider.tf) any other files in here.

AUTHENTICATION ON CLI 
configure aws
export AWS_ACCESS_KEY_ID="accesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_REGION="us-west-2"

terraform init   .........  # downloads AWS provider
terraform plan    ......... # preview changes
terraform apply  .......  # create/update resources
terraform destroy ...... # delete everything

Specific environment
terraform apply -var-file="environments/dev.tfvars"
terraform apply -var-file="environments/staging.tfvars"
terraform apply -var-file="environments/prod.tfvars"

What Actually Changes Between Environments (Typical differences)

instance sizes
number of resources
vpc CIDR ranges
scaling configs

Ex:
instance_count = 1   # dev
instance_count = 1    # staging
instance_count = 3   # prod
