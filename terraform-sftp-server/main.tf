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
  source = "./modules/iam"
  s3_bucket_arn = module.s3.s3_bucket_arn

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

module "transfer_server" {
  source      = "./modules/transfer_server"
  sftp_server_role = module.iam.sftp_server_role
 

  sftp_server_tags = {
    Name        = "SFTP Server"
    Environment = "Production"
    Project     = "Resource Automation"
    Owner       = "Sai"
    Department  = "Engineering"
    Application = "SFTP Server"
    CostCenter  = "12345"
    Tier        = "Critical"
    Service     = "SFTP"
  }
}

module "transfer_user" {
  source        = "./modules/transfer_user"
  server_id     = module.transfer_server.server_id
  sftp_server_role = module.iam.sftp_server_role

  user_name = "sai_ups"

  sftp_user_home_directory = "custom_sftp_user_home"

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
    Service     = "SFTP"
  }
}