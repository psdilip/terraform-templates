resource "aws_transfer_user" "sftp_user" {
  server_id           = var.server_id
  user_name           = var.user_name
  role                = var.sftp_server_role
  home_directory_type = "PATH"
  home_directory      = "/${var.s3_bucket_id}/upload"

  tags = var.sftp_user_tags
}
