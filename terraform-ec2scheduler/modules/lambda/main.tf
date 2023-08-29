data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file  = var.lambda_code_path
  output_path = "ec2_scheduler.zip"
}

resource "aws_lambda_function" "ec2_scheduler" {
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  filename      = "ec2_scheduler.zip"
  function_name = "EC2SchedulerFunction"
  role          = var.iam_role_arn
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  tags = var.lambda_tags

  environment {
    variables = {
      REGION = var.aws_region
      TIMEZONE   = var.timezone
      START_TIME = var.ec2_instance_start_time
      STOP_TIME   = var.ec2_instance_stop_time
    }
  }
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromCloudWatchEvent"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ec2_scheduler.function_name
  principal     = "events.amazonaws.com"

  source_arn = var.ec2_schedule_rule
}

