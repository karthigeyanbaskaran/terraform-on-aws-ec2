module "ec2-instance-private" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "5.6.1"
  depends_on    = [module.vpc]
  name          = "private-bastion"
  ami           = data.aws_ami.amazon-ami.id
  instance_type = var.ec2_type[0]
  key_name      = var.key
  # count         = 2
  # subnet_id     = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  for_each  = toset(["0", "1"]) #this is to tell how many instance need
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))


  /*
  element having the list with the index numbers, like  element(["karthik", "arun"],1)
  */
  vpc_security_group_ids = [module.security-group-private.security_group_id]
  user_data              = file("${path.module}/app.sh")

  tags = {
    "Name" = "private-ec2"
  }

}
