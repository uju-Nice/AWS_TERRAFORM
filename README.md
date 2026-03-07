Provision and deploy Infrastructure in aws cloud
N/B: Authenticate to aws by setting up aws secret key and access key with a). export ENV_VAR b). via github c). using identity provider OIDC
N/B: use modules either aws modules or github tag version ref modules in github 
1. Server (EC2 instance) and use terraform function to add 3 more ec2 instance
2. Deploy storage
3. Deploy network (VPC and its componenets)
4. Deploy EKS cluster and worker nodes
5. Deploy IAM group
6. Ensure you delete after deployment using terraform destroy
