variable "lambda_tags" {
  description = "Tags for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "timezone" {
  description = "Timezone for scheduling"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region for the Lambda function"
  type        = string
  default     = ""
}

variable "lambda_code_path" {
  description = "Path to the Lambda function code"
  default     = ""
}

variable "iam_role_arn" {
  description = ""
}

variable "ec2_instance_start_time" {
  description = "The hour when instances should start (in 24-hour format)"
  type        = number
}

variable "ec2_instance_stop_time" {
  description = "The hour when instances should stop (in 24-hour format)"
  type        = number
}

variable "ec2_schedule_rule" {
  description = ""
}