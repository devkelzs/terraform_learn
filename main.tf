module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr_1 = var.public_subnet_cidr_1
  public_subnet_cidr_2 = var.public_subnet_cidr_2
  private_subnet_cidr  = var.private_subnet_cidr

  az_1 = var.az_1
  az_2 = var.az_2
}


module "web" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.public_subnet_ids
  instance_type     = var.instance_type
  security_group_id = module.vpc.web_sg_id
  ami               = var.ami
  name              = "web-server"
}

module "app" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.private_subnet_ids
  instance_type     = var.instance_type
  security_group_id = module.vpc.app_sg_id
  ami               = var.ami
  name              = "app-server"
}

module "alb" {
  source = "./modules/alb"

  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids
  alb_sg_id        = module.vpc.alb_sg_id
}

module "asg" {
  source           = "./modules/asg"
  name             = "web-asg"
  ami              = var.ami
  instance_type    = "t3.micro"
  subnet_ids       = module.vpc.public_subnet_ids
  instance_sg_id   = module.vpc.web_sg_id
  target_group_arn = module.alb.target_group_arn
  user_data        = file("${path.module}/user-data/web.sh")
  instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
}

