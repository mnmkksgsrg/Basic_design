module "vpc" {
  source = "./module/vpc"

  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ec2" {
  source = "./module/ec2"

  ami_most_recent     = var.ec2_ami_most_recent         
  ami_name_pattern    = var.ec2_ami_name_pattern
  virtualization_type = var.ec2_virtualization_type
  ami_owners          = var.ec2_ami_owners
  instance_type       = var.ec2_instance_type
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_group_ids  = [module.vpc.web_security_group_id]
  name_tag            = var.ec2_name_tag
  associate_public_ip = var.ec2_associate_public_ip
  key_name            = var.ec2_key_name
}

module "rds" {
  source = "./module/rds"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_id
  allowed_app_sg_ids = [module.vpc.web_security_group_id]
  vpc_name           = var.vpc_name
  db_name            = var.db_name
  username           = var.db_username
  engine_version     = var.db_engine_version
  instance_class     = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
  parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot     = var.skip_final_snapshot
  kms_key_id              = var.kms_key_id
}

