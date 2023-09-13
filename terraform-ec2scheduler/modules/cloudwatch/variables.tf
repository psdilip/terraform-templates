variable "lambda_function_arn" {
  description = ""
}

variable "cloudwatch_tags" {
  description = "Tags for the Cloudwatch resources"
  type        = map(string)
  default     = {}
}

variable "ec2_instance_start_time" {
  description = "The hour when instances should start (in 24-hour format)"
  type        = number
}

variable "ec2_instance_stop_time" {
  description = "The hour when instances should stop (in 24-hour format)"
  type        = number
}