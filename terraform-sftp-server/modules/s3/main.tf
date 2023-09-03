resource "aws_s3_bucket" "sftp_server_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.sftp_server_bucket.id
  key    = "upload/"
}