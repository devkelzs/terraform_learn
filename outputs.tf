# Subnets
output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

# Security groups
output "web_sg_id" {
  value = module.vpc.web_sg_id
}

output "app_sg_id" {
  value = module.vpc.app_sg_id
}
