data "local_file" "buildspec_local" {
  filename = "${path.module}/buildspec.yml"
}

resource "aws_codestarconnections_connection" "codestar-connection" {
  name          = "${var.project}-bitbucket-${var.env}"
  provider_type = "Bitbucket"
}

resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipeline_name
  role_arn = var.codepipeline_role_arn

  artifact_store {
    location = var.bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source-output"]

      configuration = {
        ConnectionArn    = data.aws_codestarconnections_connection.bitbucket_codestar_connection.arn
        FullRepositoryId = var.fullrepositoryid
        BranchName       = var.env
      }
    }
  }

  stage {
    name = "${var.project_name}-terraform-build"

    action {
      name            = "TerraformBuild"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source-output"]
      version         = "1"

      configuration = {
        ProjectName          = "${var.project_name}-build-${var.env}"
        EnvironmentVariables = "[{\"name\":\"PIPELINE_BRANCH\",\"value\":\"${var.env}\",\"type\":\"PLAINTEXT\"}]"
      }
    }
  }

}

resource "aws_codebuild_project" "terraform-build" {
  name          = "${var.project_name}-build-${var.env}"
  description   = "${var.project_name} terraform build"
  build_timeout = "10"
  service_role  = var.codebuild_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "${var.project_name}-build-log-group"
      stream_name = "${var.project_name}-build-log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.bucket_name}/build-log"
    }
  }

  source {
    type            = "BITBUCKET"
    location        = var.repository_location
    git_clone_depth = 0
    buildspec       = data.local_file.buildspec_local.content

    git_submodules_config {
      fetch_submodules = true
    }
  }

  vpc_config {
    vpc_id             = var.vpc_id
    subnets            = var.subnets
    security_group_ids = var.security_groups
  }

  tags = var.variables
}


