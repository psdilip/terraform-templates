locals {
  ec2_instance_start_time = 4
  ec2_instance_stop_time = 16
}


module "ec2_scheduler_lambda" {
  source = "./modules/lambda"

  lambda_code_path = "modules/lambda/lambda_code"
  iam_role_arn = module.ec2_scheduler_iam.iam_role_arn

  aws_region = "us-east-1"
  timezone = "Europe/London"

  ec2_instance_start_time = local.ec2_instance_start_time
  ec2_instance_stop_time = local.ec2_instance_stop_time

  
  lambda_tags = {
    Name        = "EC2 Scheduler Lambda"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "YourName"
    Department  = "Engineering"
    Application = "EC2 Scheduler"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "Lambda"
  }
}

module "ec2_scheduler_iam" {
  source = "./modules/iam"

  iam_tags = {
    Name        = "EC2 Scheduler IAM"
    Environment = "Development"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "EC2 Scheduler"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "IAM"
  }
}

module "ec2_instance" {
  source       = "./modules/ec2"

  instance_tags = {
    Name           = "EC2 Scheduler EC2"
    Environment    = "Development"
    AutoStartStop  = "true"
    Project        = "Resource Automation"
    Owner          = "Sai"
    Department     = "Engineering"
    Application    = "EC2 Scheduler"
    CostCenter     = "12345"
    Tier           = "Critical"
    Service        = "EC2"
  }
}

module "ec2_scheduler_cloudwatch" {
  source       = "./modules/cloudwatch"

  lambda_function_arn = module.ec2_scheduler_lambda.lambda_function_arn

  ec2_instance_start_time = local.ec2_instance_start_time 
  ec2_instance_stop_time = local.ec2_instance_stop_time

  cloudwatch_tags = {
    Name           = "EC2 Scheduler Cloudwatch"
    Environment    = "Development"
    AutoStartStop  = "true"
    Project        = "Resource Automation"
    Owner          = "Sai"
    Department     = "Engineering"
    Application    = "EC2 Scheduler"
    CostCenter     = "12345"
    Tier           = "Critical"
    Service        = "Cloudwatch"
  }
}