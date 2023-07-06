data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "ec2" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  tags = {
    Name = "sprints-terraform"
  }
  #vpc_id = aws_vpc.myvpc.id
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.websg.id]
  associate_public_ip_address = true
  user_data = "${file("script.sh")}"
}