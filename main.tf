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

module "alb" {
  source = "./modules/alb"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  alb_sg_id          = module.vpc.alb_sg_id
}

module "asg" {
  source = "./modules/asg"

  ami               = var.ami
  instance_type     = var.instance_type
  subnet_ids        = module.vpc.private_subnet_ids
  instance_sg_id    = module.vpc.web_sg_id
  target_group_arn  = module.alb.target_group_arn
  user_data         = file("${path.module}/user-data/web.sh")
  name              = "web-asg"
}
