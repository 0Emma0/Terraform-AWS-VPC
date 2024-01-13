resource "aws_vpc" "vpc-1" {
        cidr_block = "10.0.0.0/16"
        enable_dns_hostnames = true
        enable_dns_support = true
        tags = {
        Name = "ExampleVirtualPrivateCloud"
        Owner = "Engineering Team"
    }
}

resource "aws_subnet" "vpc1-public-subnet" {
    vpc_id                  = aws_vpc.vpc-1.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-west-2a"
    map_public_ip_on_launch = true
        tags = {
        Name = "ExamplePublicSubnet"
        Owner = "Engineering Team"
    }
}

resource "aws_subnet" "vpc1-private-subnet" {
    vpc_id                  = aws_vpc.vpc-1.id
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "us-west-2b"
    map_public_ip_on_launch = false
            tags = {
        Name = "ExamplePrivateSubnet"
        Owner = "Engineering Team"
    }
}