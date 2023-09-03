output "sftp_server_role" {
  description = ""
  value       = aws_iam_role.sftp_server_role.arn
}
output "sftp_server_logging_role" {
  description = ""
  value       = aws_iam_role.sftp_server_logging_role.arn
}