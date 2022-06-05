resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {
    Name = "public"

  }
}


resource "aws_route_table_association" "private-us-east-1a" {
  route_table_id = aws_route_table.private.id
  subnet_id = aws_subnet.private-us-east-1a.id
}


resource "aws_route_table_association" "private-us-east-1b" {
  route_table_id = aws_route_table.private.id
  subnet_id = aws_subnet.private-us-east-1b.id
}


resource "aws_route_table_association" "public-us-east-1a" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public-us-east-1a.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public-us-east-1b.id
}
