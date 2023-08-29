resource "aws_transfer_user" "sftp_user" {
  server_id = var.server_id
  user_name = var.user_name
  role      = var.sftp_server_role
  home_directory = "s3://${var.s3_bucket_arn}/${var.sftp_user_home_directory}/"

  # policy = aws_iam_policy.sftp_server_policy.arn

  tags = var.sftp_user_tags
}
