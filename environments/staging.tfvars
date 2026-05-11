instance_type = "t3.small"
vpc_cidr_range = "10.0.1.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
AvailabilityZones = ["us-east-1a", "us-east-1b", "us-east-1c"]  
environment   = "staging"

