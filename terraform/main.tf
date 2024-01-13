terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region  = var.aws_region_to_use
}

module "vpc" {
  source = "./modules/vpc"
}

module "internet_gateway" {
    source = "./modules/internet_gateway"
    
    vpc-1-id = module.vpc.vpc-1.id
    vpc-1-subnet-public-id = module.vpc.vpc-1-public-subnet-id
    route-table-vpc1-id = module.internet_gateway.route-table-vpc1-id
}

module "security_group" {
  source = "./modules/security_group"

  vpc-1-id = module.vpc.vpc-1-id
}