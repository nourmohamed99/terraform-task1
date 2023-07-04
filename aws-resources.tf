resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "test"
    project = "sprints"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "sprints-s3-terraform"
}

resource "aws_subnet" "subnet-1" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.dev.id
    
}