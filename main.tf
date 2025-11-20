provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Myserver" {
  ami                    = var.my_ami
  instance_type          = var.My_instance
  key_name               = var.my_key
  /*vpc_security_group_ids = */

  tags = {
    Name = "MyFirstServer"
  }
}
