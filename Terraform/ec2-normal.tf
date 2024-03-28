# resource "aws_instance" "test" {
#   ami           = data.aws_ami.amazon-ami.id
#   instance_type = var.ec2_type[0]
#   key_name      = var.key
#   # user_data              = file("${path.module}/app.sh")
#   vpc_security_group_ids = [aws_security_group.sg-ssh.id, aws_security_group.sg-ssl.id] #must mention ID at end
#   # count                  = 2
#   for_each = toset(keys({ for az, instance in data.aws_ec2_instance_type_offerings.example : az => instance.instance_types if length(instance.instance_types) != 0 }))


#   availability_zone = each.key

#   tags = {
#     "Name"  = "karthik" #no need to give the extension like karthik.pem
#     "index" = "No-${each.key}"
#   }
# }


