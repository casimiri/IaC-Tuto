resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Team = "App team"
  }
}

# Public subnet in VPC
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
}

output "vpc_id"{
  value = aws_vpc.vpc.id
}