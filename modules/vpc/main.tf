resource "aws_vpc" "this" {
  cidr_block = "var.vpc_cidr"
  description  = "nothing"
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnet_cidr
  description = ""
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnet_cidr
  description = ""
}

resource "aws_route_table" "this" {
}

resource "aws_security_group" "HTTP" {
}

resource "aws_security_group_association" "main" {
}

