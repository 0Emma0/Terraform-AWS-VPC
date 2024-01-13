# Input variable definitions IGW

variable "vpc-1-id" {
    type    = string
    description = "The ID of VPC 1"
}

variable "vpc-1-subnet-public-id" {
  description = "The ID of the public subnet in VPC 1"
  type        = string
}

variable "route-table-vpc1-id" {
  description = "The ID of the route table for VPC 1"
  type        = string
}