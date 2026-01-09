module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "web" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.public_subnet_id
  instance_type     = var.instance_type
  security_group_id = module.vpc.web_sg_id
  ami               = var.ami
  name              = "web-server"
}

module "app" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.private_subnet_id
  instance_type     = var.instance_type
  security_group_id = module.vpc.app_sg_id
  ami               = var.ami
  name              = "app-server"
}

