module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name             = "karthik-vpc"
  azs              = ["ap-south-1a", "ap-south-1b"]
  cidr             = "10.0.0.0/16"
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets   = ["10.0.100.0/24", "10.0.101.0/24"]
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]


  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  enable_dns_hostnames               = true
  enable_dns_support                 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    "Name" = "Dev"
  }

  vpc_tags = {
    "Name" = "My_VPC"
  }

  public_subnet_tags = {
    "Name" = "public-subnet"
  }

  private_subnet_tags = {
    "Name" = "private-subnet"
  }
  database_subnet_tags = {
    "Name" = "database-subnet"
  }
}
