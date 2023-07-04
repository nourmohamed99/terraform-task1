provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["/home/hp/.aws/credentials"]
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  #owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           =  "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  user_data = file("script.sh")

  tags = {
    Name = "HelloWorld"
  }
}