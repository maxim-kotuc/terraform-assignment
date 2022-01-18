#internet gw is necessary to access internet
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.project.id

  tags = {
    Name = "internet_gw"
  }
}

#elastic ip is necessary for nat gw
resource "aws_eip" "nat" {
  vpc = true
}

#nat gw is used as we want our instances in private subnet to be able to access the internet
#but not to be accessible from the outside by other means than the load balancer
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.internet_gw]
}

#two route tables for the two subnets as the logical routing is what actually
#makes them private/public
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}