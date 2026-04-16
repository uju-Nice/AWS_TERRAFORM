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

output "name" {
  value = aws_instance.example.tags.Name
}

output "instance_id" {
  value = aws_instance.example.id
}   

output "vpc_id" {
  value = module.vpc.vpc_id
}   

output "bucket_id" {
    description = "The ID of the S3 bucket"
    value = aws_s3_bucket.nickos_bucket.id
}

output "bucket_arn" {
    description = "The ARN of the S3 bucket"
    value = aws_s3_bucket.nickos_bucket.arn
}
