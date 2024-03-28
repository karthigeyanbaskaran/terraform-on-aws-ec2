module "elb_http" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.2"
  name    = "elb"
  /*
  for_each  = toset(["0", "1"]) #this is to tell how many instance need
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))

  same this we can't do here because we just use to reference this 2 subnets not creating individually.
  */
  subnets = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  /* array la output eruku athan epdi eruku 
  epdi varuthunala nambala epdi ==> [for instance in module.ec2-instance-private : instance.id] poda mudiyala
  athan epdi podurom ==> [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  output:
  private_subnets               = [
      + (known after apply),
      + (known after apply),
    ]
  */

  security_groups = [module.lb-security-group.security_group_id]

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 81
      lb_protocol       = "http"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  // ELB attachments
  number_of_instances = length(module.ec2-instance-private)
  instances           = [for instance in module.ec2-instance-private : instance.id]
  /*
  instance id map la varthu nala namba for instance in module.ec2-instance-private : instance.id] epdi potu erukom
  output:
  instance-private-id           = {
      + "0" = (known after apply)
      + "1" = (known after apply)
    }
  */
  tags = {
    "Name" = "ELB"
  }
}
