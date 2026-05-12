output "vpc_id" {
    description = "The vpc "
    value = aws_vpc.this.id
}

output "public_subnets" {
    description = "Public subnet"
    value = "${aws_subnet.public.*.id}"
}

output "private_subnets" {
    description = "Private subnet"
    value = "${aws_subnet.private.*.id}"
}