data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.lambda_code_path
  output_path = "${path.module}/lambda_code/ec2_scheduler.zip"
}

resource "aws_lambda_function" "ec2_scheduler" {
  filename      = "${path.module}/lambda_code/ec2_scheduler.zip"
  function_name = "EC2SchedulerFunction"
  role          = var.iam_role_arn
  handler       = "index.handler"
  runtime       = "python3.8"

  tags = var.lambda_tags

  environment {
    variables = {
      REGION = var.aws_region
      TIMEZONE   = var.timezone
    }
  }
}

