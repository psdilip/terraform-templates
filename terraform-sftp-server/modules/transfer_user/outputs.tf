output "sftp_user_home_directory_id" {
  description = "ID of the created SFTP user's home directory."
  value       = aws_transfer_user.sftp_user.server_id
}
