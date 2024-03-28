# resource "aws_security_group" "sg-ssh" {
#   description = "open ssh to all"

#   ingress {
#     description = "22 open to all"
#     from_port   = 22 #number no need to double quotes
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] #in numbers array need to double quotes


#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

# }

# resource "aws_security_group" "sg-ssl" {
#   description = "open ssl to all"

#   ingress {
#     description = "443 open to all"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]


#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

# }
