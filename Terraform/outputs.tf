# # # output "publicip" {
# # #   description = "public ip"
# # #   value       = aws_instance.test.public_ip #not values --> value only

# # # }

# # # output "publicdns" {
# # #   description = "public ip"
# # #   value       = aws_instance.test.public_dns

# # # }

# # #list
# # output "publicdns-list1" {
# #   value = [for instance in aws_instance.test : instance.public_dns]

# # }
# # #map
# # output "publicdns-map" {
# #   value = { for instance in aws_instance.test : instance.id => instance.public_dns }

# # }
# # #advanced map
# # output "publicdns-map-a" {
# #   value = { for c, instance in aws_instance.test : c => instance.public_dns } #it will show 0=adsfa & 1=adsfasdf

# # }
# # #splat
# # output "publicdns-splat-dns" {
# #   value = aws_instance.test.*.public_dns

# # }
# # #General Splat
# # output "publicdns-splat-G" {
# #   value = aws_instance.test[*].public_dns

# # }
# output "public_dns" {
#   value = { for c, instance in aws_instance.test : c => instance.public_dns }

# }

# output "offerings" {
#   value = keys({ for az, instance in data.aws_ec2_instance_type_offerings.example : az => instance.instance_types if length(instance.instance_types) != 0 })

# }


# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}

#SG
output "security_group_id_public" {
  description = "The ID of the security group"
  value       = module.security-group-public.security_group_id
}

output "security_group_vpc_id_public" {
  description = "The VPC ID"
  value       = module.security-group-public.security_group_vpc_id
}

output "security_group_name_public" {
  description = "The name of the security group"
  value       = module.security-group-public.security_group_name
}


output "security_group_id_private" {
  description = "The ID of the security group"
  value       = module.security-group-private.security_group_id
}

output "security_group_vpc_id_private" {
  description = "The VPC ID"
  value       = module.security-group-private.security_group_vpc_id
}

output "security_group_name_private" {
  description = "The name of the security group"
  value       = module.security-group-private.security_group_name
}

#EC2

output "instance-public-id" {
  value = module.ec2-instance.id
}
output "instance-public-ip" {
  value = module.ec2-instance.public_ip
}
output "instance-private-id" {
  value = { for c, instance in module.ec2-instance-private : c => instance.id }
  #module.ec2-instance-private.id
}
output "instance-private-ip" {
  value = { for c, instance in module.ec2-instance-private : c => instance.private_ip }
}
####CLB####
output "elb_id" {
  description = "The name of the ELB"
  value       = module.elb_http.elb_id
}

output "elb_name" {
  description = "The name of the ELB"
  value       = module.elb_http.elb_name
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = module.elb_http.elb_dns_name
}

output "elb_instances" {
  description = "The list of instances in the ELB (if may be outdated, because instances are attached using elb_attachment resource)"
  value       = module.elb_http[*].elb_instances
}

output "elb_source_security_group_id" {
  description = "The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances"
  value       = module.elb_http.elb_source_security_group_id
}

output "elb_zone_id" {
  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
  value       = module.elb_http.elb_zone_id
}
