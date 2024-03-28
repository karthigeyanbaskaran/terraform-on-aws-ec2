module "lb-security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "lb-sg"
  description = "80 IP only"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    "Name" = "lb-SG"
  }
}
