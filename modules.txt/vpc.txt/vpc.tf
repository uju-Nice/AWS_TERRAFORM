resource "aws_vpc" "nickos_vpc" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.nickos_vpc.id
    cidr_block = var.public_subnet_cidrs[0]
    availability_zone = var.availability_zones[0]

}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.nickos_vpc.id
    cidr_block = var.private_subnet_cidrs[0]
    availability_zone = var.availability_zones[1]
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.nickos_vpc.id
}

resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.public[0].id
    allocation_id = aws_eip.nat.id
}