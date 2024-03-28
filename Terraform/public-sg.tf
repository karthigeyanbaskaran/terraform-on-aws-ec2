module "security-group-public" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.2"
  name                = "public-sg"
  description         = "ssh to all"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  egress_rules = ["all-all"]
  tags = {
    "Name" = "Public-SG"
  }
}
