data "aws_iam_policy_document" "transfer_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["transfer.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}



resource "aws_iam_policy" "sftp_server_policy" {
  name        = "SFTP Server Policy"
  description = "Policy for SFTP server access to S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:ListBucket"],
        Effect   = "Allow",
        Resource = var.s3_bucket_arn,
        Condition = {
          StringLike = {
            "s3:prefix" : ["upload/*"]
          }
        }
      },
      {
        Action = ["s3:PutObject", "s3:GetObjectAcl", "s3:GetObject", "s3:DeleteObjectVersion", "s3:DeleteObject", "s3:GetBucketLocation",
        "s3:PutObjectAcl", "s3:GetObjectVersion"],

        Effect   = "Allow",
        Resource = "${var.s3_bucket_arn}/*",
        Condition = {
          StringEqualsIfExists = {
            "s3:prefix" : ["upload/*"]
          }
        }
      }
    ]
  })
}

resource "aws_iam_role" "sftp_server_role" {
  name               = "SFTP Server Role"
  assume_role_policy = data.aws_iam_policy_document.transfer_assume_role.json
  tags               = var.iam_tags
}


resource "aws_iam_role_policy_attachment" "sftp_server_policy_attachment" {
  policy_arn = aws_iam_policy.sftp_server_policy.arn
  role       = aws_iam_role.sftp_server_role.name
}

resource "aws_iam_role" "sftp_server_logging_role" {
  name                = "SFTP Server Logging Role"
  assume_role_policy  = data.aws_iam_policy_document.transfer_assume_role.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSTransferLoggingAccess"]
}
