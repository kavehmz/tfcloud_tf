provider "aws" {
  region     = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-11-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["136693071363"]
}


resource "aws_instance" "debian" {
  ami           = data.aws_ami.debian.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

output "instance_ami" {
  value = aws_instance.debian.ami
}

output "instance_arn" {
  value = aws_instance.debian.arn
}
