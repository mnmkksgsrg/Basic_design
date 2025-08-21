resource "aws_security_group" "web" {
  name        = "${var.vpc_name}_web_security_group"
  description = "webサーバーのセキュリティグループ"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.vpc_name}_web_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  from_port         = 80
  to_port           = 80
  ip_protocol          = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.web.id
  from_port         = 443
  to_port           = 443
  ip_protocol          = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_web" {
  security_group_id = aws_security_group.web.id
  from_port         = 0
  to_port           = 0
  ip_protocol          = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_security_group" "rds" {
  name        = "${var.vpc_name}_rds_security_group"
  description = "rdsのセキュリティグループ"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.vpc_name}_rds_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_to_rds" {
  security_group_id            = aws_security_group.rds.id
  referenced_security_group_id = aws_security_group.web.id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_rds" {
  security_group_id            = aws_security_group.rds.id
  from_port                    = 0
  to_port                      = 0
  ip_protocol                  = "-1"
  cidr_ipv4                    = "0.0.0.0/0"
}
