resource "aws_instance" "ec2-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_role.ec2_role.name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "EC2S3UploadRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_policy_attachment" "attach_policy" {
  name       = "ec2-s3-upload-policy-attachment"
  policy_arn = aws_iam_policy.s3_upload_policy.arn
  roles      = [aws_iam_role.ec2_role.name]
}