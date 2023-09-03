resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "PUBLIC"
  logging_role           = var.sftp_server_logging_role
  security_policy_name   = "TransferSecurityPolicy-2020-06"
  structured_log_destinations = [
    "${var.cloudwatch_log_group}:*"
  ]

  tags = var.sftp_server_tags
}