data "aws_ami" "ubuntu" {
  most_recent = var.ami_most_recent

  filter {
    name   = "name"
    values = var.ami_name_pattern
  }

  filter {
    name   = "virtualization-type"
    values = var.virtualization_type
  }

  owners = var.ami_owners
}

resource "aws_instance" "wordpress" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "wordpress"
  }
}




