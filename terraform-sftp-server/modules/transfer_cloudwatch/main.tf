resource "aws_cloudwatch_log_group" "transfer" {
  name_prefix = "transfer_test_"

  tags = var.sftp_cloudwatch_tags

}