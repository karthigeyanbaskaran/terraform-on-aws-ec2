module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = "public-bastion"

  ami                         = data.aws_ami.amazon-ami.id
  instance_type               = var.ec2_type[0]
  key_name                    = var.key
  availability_zone           = var.azs[0]
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security-group-public.security_group_id]
  associate_public_ip_address = true
}
