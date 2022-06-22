provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}
resource "aws_instance" "demo" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
  tags = {
    Name = "first_to_create_with_terraform"
  }
}