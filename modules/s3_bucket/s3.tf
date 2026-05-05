resource "aws_s3_bucket" "s3_bucket" { 
  bucket = "nickos-s3-bucket"

#   tags = {
#     Name        = "nickos-s3-bucket"
#     Environment = "Dev"
#   }
}

resource "aws_s3_bucket_versioning" "this" {
    bucket = aws_s3_bucket.s3_bucket.id 
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_policy" "nickos_bucket_policy" {
    bucket = aws_s3_bucket.s3_bucket.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject"
                Resource = "${aws_s3_bucket.s3_bucket.arn}/*"
            }
        ]
    })
}