data "aws_ami" "amazon-ami" {
  most_recent = true
  owners      = ["amazon"]

  # filter {
  #   name   = "name"
  #   values = ["amzn2-ami-hvm-*-gp2"]
  # }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

data "aws_availability_zones" "demo" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# data "aws_ec2_instance_type_offerings" "example" {
#   for_each = toset(data.aws_availability_zones.demo.names)
#   filter {
#     name   = "instance-type"
#     values = ["t2.micro"]
#   }

#   filter {
#     name   = "location"
#     values = [each.key]
#   }

#   location_type = "availability-zone"
# }
