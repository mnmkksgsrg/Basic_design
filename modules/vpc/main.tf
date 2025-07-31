resource "aws_vpc" "this" {
  cidr_block = "var.vpc_cidr"

  tags = {
    name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr

  tags = {
    name = "${var.vpc_name}_public_subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "${var.vpc_name}_private_subnet"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}_internet_gateway"
  }
}

resource "aws_route_table" "this" {

  vpc_id = aws_vpc.this.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id

    tags = {
      Name = "${var.vpc_name}_route_table"
    }
  }
}

resource "aws_route_table_assciation" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_asociation" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.i
}

resource "aws_security_group" "allow_web_traffic" {
  vpc_id      = aws_vpc.this.id
  description = "allow HTTP/HTTPS inbound traffic and all outbound traffic"

  tags = {
    Name = "${var.vpc_name}_allow_web_traffic_security_group"
  }
}

#aws_vpc_security...となるのは過去の仕様変更と区別し、明示的にVPCとの関連付けを示すため
#vpc_cidrを使うのではなく、aws_vpc.this.cidr_blockで参照するのは、リソースの依存関係を示すため
resource "aws_vpc_security_group_ingress_rule" "allow_HTTP_ipv4" {
  security_group_id = aws_security_group.allow_web_traffic.id
  cidr_ipv4         = aws_vpc.this.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_HTTP_ipv6" {
  security_group_id = aws_security_group.allow_web_traffic.id
  cidr_ipv6         = aws_vpc.this.ipv6_cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_HTTPS_ipv4" {
  security_group_id = aws_security_group.allow_web_traffic.id
  cidr_ipv4         = aws_vpc.this.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_HTTPS_ipv6" {
  security_group_id = aws_security_group.allow_web_traffic.id
  cidr_ipv6         = aws_vpc.this.ipv6_cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_web_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protcol        = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_web_traffic.id
  cidr_ipv6         = "::/0"
  ip_protcol        = "-1"
}








