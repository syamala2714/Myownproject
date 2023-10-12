resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name # Replace with your desired bucket name
  acl    = var.acl_type              # Access control list (can be "private", "public-read", etc.)

  tags = {
    Name = var.s3_bucket_name
  }
}

resource "aws_iam_policy" "s3_upload_policy" {
  name        = "S3UploadPolicy"
  description = "IAM policy for S3 upload access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:ListBucket",
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:s3:::var.s3_bucket_name",
          "arn:aws:s3:::var.s3_bucket_name/*",
        ],
      },
    ],
  })
}