locals {
  public_subnets = {
    "ap-northeast-1a" = {
      cidr_block = "10.0.0.0/24"
    }
    "ap-northeast-1c" = {
      cidr_block = "10.0.1.0/24"
    }
  }
  private_subnets = {
    "ap-northeast-1a" = {
      cidr_block = "10.0.10.0/24"
    }
    "ap-northeast-1c" = {
      cidr_block = "10.0.11.0/24"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets
}

module "ec2" {
  source = "./modules/ec2"

  ami_most_recent         = var.ec2_ami_most_recent
  ami_name_pattern        = var.ec2_ami_name_pattern
  ami_virtualization_type = var.ec2_virtualization_type
  ami_owners              = var.ec2_ami_owners
  instance_type           = var.ec2_instance_type
  subnet_id               = module.vpc.public_subnet_ids["ap-northeast-1a"]
  security_group_ids      = [aws_security_group.app.id]
  name                    = var.ec2_name_tag
  key_name                = var.ec2_key_name
}

module "rds" {
  source = "./modules/rds"

  name                    = "basic"
  vpc_id                  = module.vpc.vpc_id
  db_subnet_ids           = module.vpc.private_subnet_ids
  vpc_security_group_ids  = []
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  db_parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot     = var.skip_final_snapshot
  kms_key_id              = var.kms_key_id

  tags = {
    Name = "basic_db"
  }
}
