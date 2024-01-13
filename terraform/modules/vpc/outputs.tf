# Output variable definitions

output "vpc-1-id" {
  value = aws_vpc.vpc-1.id
}

output "vpc-1" {
  value = aws_vpc.vpc-1
}

output "vpc-1-public-subnet-id" {
  value = aws_subnet.vpc1-public-subnet.id
}

output "vpc-1-private-subnet-id" {
  value = aws_subnet.vpc1-private-subnet.id
}
