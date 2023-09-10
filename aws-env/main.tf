resource "aws_vpc" "vpc1" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    environment = var.environment
  }
}

resource "aws_subnet" "snet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.location}a"

  tags = {
    environment = var.environment
  }
}
