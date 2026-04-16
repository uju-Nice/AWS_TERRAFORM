Provision and deploy Infrastructure in aws cloud
N/B:Use the below options to Authenticate to aws by setting up aws secret key and access key with 
a. export ENVIRONEMENT_VARIABLE ( for testing purposes ONLY in the CLI, Not recomended)


Call any module you want using the tag version as ref instead of repeating it.

REPO - environment folder ( dev.tfvars, staging.tfvars, production.tfvars )
REPO - (main.tf, variable.tf, output.tf, provider.tf) any other files in here.

AUTHENTICATION ON CLI 
configure aws
% export AWS_ACCESS_KEY_ID="anaccesskey"
% export AWS_SECRET_ACCESS_KEY="asecretkey"
% export AWS_REGION="us-west-2"

terraform init
terraform plan
terraform apply 
terraform destroy

Specific environment
terraform apply -var-file="dev.tfvars"
terraform apply -var-file="staging.tfvars"
terraform apply -var-file="prod.tfvars"

What Actually Changes Between Environments (Typical differences)

instance sizes
number of resources
vpc CIDR ranges
scaling configs

Ex:
instance_count = 1   # dev
instance_count = 1    # staging
instance_count = 3   # prod
