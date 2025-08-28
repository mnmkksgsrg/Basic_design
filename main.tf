module "vpc" {
  source = "./modules/vpc"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ec2" {
  source = "./modules/ec2"

  ec2_name           = var.ec2_name
  subnet_id          = values(module.vpc.public_subnet_ids)[0]
  security_group_ids = [module.security_group.web_security_group_id]
}

module "rds" {
  source = "./modules/rds"

  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  db_subnet_ids          = [for az, id in module.vpc.private_subnet_ids : id]
  vpc_security_group_ids = [module.security_group.rds_security_group_id]

  tags = {
    Name = var.db_name
  }
}

module "security_group" {
  source = "./modules/security_group"

  vpc_name = var.vpc_name
  vpc_id   = module.vpc.vpc_id
}



