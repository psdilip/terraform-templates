resource "aws_s3_bucket" "sftp_server_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}