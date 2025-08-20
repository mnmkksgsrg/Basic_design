data "aws_ami" "ubuntu" {
  most_recent = var.ami_most_recent

  filter {
    name   = "name"
    values = [var.ami_name_pattern]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_virtualization_type]
  }

  owners = var.ami_owners
}

resource "aws_instance" "basic" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  web_security_group_id = var.web_security_group_id
  key_name               = var.key_name

  tags = {
    Name = var.name
  }
}

