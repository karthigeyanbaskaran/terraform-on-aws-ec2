module "security-group-private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "private-sg"
  description = "80 & 22 to private IP only"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    "Name" = "Private_SG"
  }
}
