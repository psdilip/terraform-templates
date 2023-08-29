resource "aws_cloudwatch_event_rule" "ec2_schedule_rule" {
  name        = "EC2ScheduleRule"
  description = "Scheduled EC2 instance start and stop"
  schedule_expression = "cron(0 ${var.ec2_instance_start_time}-${var.ec2_instance_stop_time} ? * * *)"
  # schedule_expression = "rate(5 minutes)"
  
}

resource "aws_cloudwatch_event_target" "ec2_schedule_target" {
  rule      = aws_cloudwatch_event_rule.ec2_schedule_rule.name
  target_id = "EC2SchedulerFunctionTarget"
  arn       = var.lambda_function_arn
}