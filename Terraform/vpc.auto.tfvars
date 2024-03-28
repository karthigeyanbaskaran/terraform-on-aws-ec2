#auto.tfvars are useful while creating big amount of terraform code, so we can separate the file like
#vpc.auto.tfvars, sg.auto.tfvars, datasource.auto.tfvars......like that....
name             = "karthik-vpc"
azs              = ["ap-south-1a", "ap-south-1b"]
cidr             = "10.0.0.0/16"
private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets   = ["10.0.100.0/24", "10.0.101.0/24"]
database_subnets = ["10.0.100.0/24", "10.0.101.0/24"]
