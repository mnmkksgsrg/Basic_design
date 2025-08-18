resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.db_name}_subnet_group"
  }
}

resource "aws_security_group" "allow_rds_traffic" {
  vpc_id      = var.vpc_id
  description = "security group for rds"

  tags = {
    Name = "${var.vpc_name}_allow_rds_traffic_security_group"
  }

  dynamic "ingress" {
    for_each = toset(var.allowed_app_sg_ids)
    content {
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      security_groups = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_db_instance" "rds" {
  allocated_storage             = var.allocated_storage
  storage_type                  = "gp3"
  db_name                       = var.db_name
  engine                        = "mysql"
  engine_version                = var.engine_version
  port                          = 3306
  instance_class                = var.instance_class
  username                      = var.username
  manage_master_user_password   = true
  master_user_secret_kms_key_id = var.kms_key_id
  parameter_group_name          = var.parameter_group_name
  skip_final_snapshot           = var.skip_final_snapshot
  db_subnet_group_name          = aws_db_subnet_group.this.name
  vpc_security_group_ids        = [aws_security_group.allow_rds_traffic.id]
  publicly_accessible           = false
}
