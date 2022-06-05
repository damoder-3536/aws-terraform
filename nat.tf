resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.public-us-east-1a.id
  allocation_id = aws_eip.nat.id

  tags = {
    Name = "nat"
  }
  depends_on = [aws_internet_gateway.igw]
}
