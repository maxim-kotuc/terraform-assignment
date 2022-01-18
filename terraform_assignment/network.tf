resource "aws_vpc" "project" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.az

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = var.az

  tags = {
    Name = "private_subnet"
  }
}