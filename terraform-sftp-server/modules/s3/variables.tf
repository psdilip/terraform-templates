variable "bucket_name" {
  description = "Name of the S3 bucket for the SFTP server."
}

variable "s3_tags" {
  description = "Tags for the S3 Bucket"
  type        = map(string)
  default     = {}
}