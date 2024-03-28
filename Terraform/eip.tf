resource "aws_eip" "lb" {
  depends_on = [module.ec2-instance, module.vpc] #meta-data
  instance   = module.ec2-instance.id
  domain     = "vpc"
  tags = {
    "Name" = "EIP"
  }
}
