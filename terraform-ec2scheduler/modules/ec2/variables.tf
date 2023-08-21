variable "instance_tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
  default     = {}
}
