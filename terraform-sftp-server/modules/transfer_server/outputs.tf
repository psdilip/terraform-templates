output "server_id" {
  description = "ID of the created Transfer Server."
  value       = aws_transfer_server.sftp_server.id
}
