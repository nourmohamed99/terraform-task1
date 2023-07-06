resource "aws_subnet" "public" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.myvpc.id
    
}