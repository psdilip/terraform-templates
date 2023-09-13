output "ec2_schedule_rule" {
  value = aws_cloudwatch_event_rule.ec2_schedule_rule.arn
}