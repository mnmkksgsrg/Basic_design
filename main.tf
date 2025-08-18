module "vpc" {
  source = "./module/vpc"

  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ec2" {
  source = "./module/ec2"

  ami_most_recent     = var.ec2_ami_most_recent         
  ami_name_pattern    = var.ec2_ami_name_pattern
  virtualization_type = var.ec2_virtualization_type
  ami_owners          = var.ec2_ami_owners

  # EC2 インスタンス
  instance_type       = var.ec2_instance_type

  # ネットワーク
  subnet_id           = module.vpc.public_subnet_id
  security_group_ids  = [module.vpc.web_security_group_id]

  # 任意
  name_tag            = var.ec2_name_tag
  associate_public_ip = var.ec2_associate_public_ip
  key_name            = var.ec2_key_name
}







module "rds" {
  source = "./module/rds"

  # ネットワーク（VPCから受け取り）
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = [module.vpc.private_subnet_id]   # いまは1つしかないため配列化
  allowed_app_sg_ids = [module.vpc.web_security_group_id]
  vpc_name           = var.vpc_name

  # DB設定
  db_name            = var.db_name
  username           = var.db_username
  engine_version     = var.db_engine_version
  instance_class     = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
  parameter_group_name = var.db_parameter_group_name

  # 運用系
  skip_final_snapshot     = var.skip_final_snapshot
  kms_key_id              = var.kms_key_id
  # もし rds モジュールに以下があれば渡す:
  # backup_retention_days = var.db_backup_retention_days
  # deletion_protection   = var.db_deletion_protection
  # multi_az              = var.db_multi_az
}

