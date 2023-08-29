resource "aws_iam_role" "sftp_server_role" {
  name = "sftp_server_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "transfer.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "sftp_server_policy" {
  name        = "sftp_server_policy"
  description = "Policy for SFTP server access to S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:ListBucket"],
        Effect   = "Allow",
        Resource = var.s3_bucket_arn,
        # Condition = {
        #   StringLike = {
        #     "s3:prefix": ["${aws_transfer_user.sftp_user_home_directory.id}/*"]
        #   }
        # }
      },
      {
        Action   = ["s3:PutObject", "s3:GetObjectAcl", "s3:GetObject",  "s3:DeleteObjectVersion", "s3:DeleteObject", "s3:GetBucketLocation", 
        "s3:PutObjectAcl", "s3:GetObjectVersion"],
        
        Effect   = "Allow",
        Resource = "${var.s3_bucket_arn}/*",
        # Condition = {
        #   StringEqualsIfExists = {
        #     "s3:prefix": ["${aws_transfer_user.sftp_user_home_directory.id}/*"]
        #   }
        # }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sftp_server_policy_attachment" {
  policy_arn = aws_iam_policy.sftp_server_policy.arn
  role       = aws_iam_role.sftp_server_role.name
}
