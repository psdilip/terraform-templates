variable "server_id" {
  description = "ID of the Transfer Server."
}

variable "sftp_server_role" {
  description = "Name of the IAM role for the SFTP user."
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket for the SFTP user's home directory."
}

variable "sftp_user_tags" {
  description = ""
}

variable "sftp_user_home_directory" {
  description = "Name of the SFTP user's home directory."
}

variable "user_name" {
  description = ""
}