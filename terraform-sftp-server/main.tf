# locals {
#     sftp_user_home_directory = "customsftpuserhome"
# }

module "s3" {
  source      = "./modules/s3"
  bucket_name = "qlik-sai-test1234"

  s3_tags = {
    Name        = "SFTP S3 Bucket"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "SFTP Server"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "S3"
  }
}

module "iam" {
  source        = "./modules/iam"
  s3_bucket_arn = module.s3.s3_bucket_arn

  # sftp_user_home_directory = local.sftp_user_home_directory
  iam_tags = {
    Name        = "SFTP IAM"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "SFTP Server"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "IAM"
  }
}


module "transfer_user" {
  source           = "./modules/transfer_user"
  server_id        = module.transfer_server.server_id
  sftp_server_role = module.iam.sftp_server_role

  user_name = "saiups"

  s3_bucket_id = module.s3.s3_bucket_id

  # sftp_user_home_directory = local.sftp_user_home_directory

  s3_bucket_arn = module.s3.s3_bucket_arn

  sftp_user_tags = {
    Name        = "SFTP User"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "SFTP Server"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "SFTP User"
  }
}

module "transfer_cloudwatch" {
  source = "./modules/transfer_cloudwatch"
  sftp_cloudwatch_tags = {
    Name        = "SFTP User"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "SFTP Server"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "Cloudwatch"
  }
}

module "transfer_server" {
  source                   = "./modules/transfer_server"
  sftp_server_role         = module.iam.sftp_server_role
  sftp_server_logging_role = module.iam.sftp_server_logging_role

  cloudwatch_log_group = module.transfer_cloudwatch.cloudwatch_log_group



  sftp_server_tags = {
    Name        = "SFTP Server"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "SFTP Server"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "SFTP Server"
  }
}
