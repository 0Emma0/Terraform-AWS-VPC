resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = var.vpc-1-id
    tags = {
        Name = "ExampleInternetGateway"
    }
}

resource "aws_route_table" "route-1" {
  vpc_id = var.vpc-1-id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name  = "ExampleRouteTable"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = var.vpc-1-subnet-public-id
    route_table_id = var.route-table-vpc1-id
}
