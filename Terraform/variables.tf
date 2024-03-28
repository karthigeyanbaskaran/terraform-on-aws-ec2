variable "aws_region" {
  description = "region"
  type        = string
  default     = "ap-south-1"

}

variable "ec2_type" {
  description = "region"
  type        = list(string)
  default     = ["t2.micro", "t3.small"]

}

variable "key" {
  description = "region"
  type        = string
  default     = "karthik" #.PEM no need

}


variable "name" {
  default = "karthik-vpc"

}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]

}

variable "cidr" {
  default = "10.0.0.0/16"

}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.100.0/24", "10.0.101.0/24"]

}

variable "database_subnets" {
  type    = list(string)
  default = ["10.0.100.0/24", "10.0.101.0/24"]


}
