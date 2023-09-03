output "s3_bucket_arn" {
  description = "ARN of the created S3 bucket."
  value       = aws_s3_bucket.sftp_server_bucket.arn
}

output "s3_bucket_id" {
  description = "ID of the created S3 bucket."
  value       = aws_s3_bucket.sftp_server_bucket.id
}