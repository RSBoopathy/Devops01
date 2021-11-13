resource "aws_vpc" "global-vpc" {
  cidr_block       = "201.0.0.0/21"
  instance_tenancy = "default"

  tags = {
    Name = "Dev_Vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.global-vpc.id
  cidr_block = "201.0.0.0/21"

  tags = {
    Name = "Sub_Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.global-vpc.id

  tags = {
    Name = "IGW_Main"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.global-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "MyRoute"
  }
}