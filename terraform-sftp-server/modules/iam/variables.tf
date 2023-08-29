variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket for the SFTP server."
}

variable "iam_tags" {
  description = "Tags for the IAM"
  type        = map(string)
  default     = {}
}
