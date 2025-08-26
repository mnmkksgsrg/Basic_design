resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}_subnet_group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "${var.db_name}_subnet_group"
  }
}

resource "aws_db_instance" "this" {
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  db_name                 = var.db_name
  engine                  = var.engine
  engine_version          = var.engine_version
  port                    = 3306
  instance_class          = var.instance_class
  username                = var.db_username
  password                = var.db_password
  multi_az                = var.multi_az
  publicly_accessible     = var.publicly_accessible
  backup_retention_period = var.backup_retention_period
  deletion_protection     = var.deletion_protection
  storage_encrypted       = var.storage_encrypted
  kms_key_id              = var.kms_key_id
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  skip_final_snapshot     = var.skip_final_snapshot

  tags = {
    Name = "${var.db_name}_instance"
  }
}


