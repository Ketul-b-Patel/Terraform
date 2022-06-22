provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myec2" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  tags = {
    Name = "first_to_create_with_terraform"
  }
}

resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name = "demo-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
}