variable "project_name" {
  type        = string
  description = "client project name"
}

variable "codestar_arn" {
  type        = string
  description = "arn of the codestar connection between bitbucket and aws code services"
}

variable "codepipeline_name" {
  type        = string
  description = "name of codepipeline"
}

variable "codepipeline_role_arn" {
  type        = string
  description = "role that codepipeline will assume"
}

variable "codebuild_name" {
  type        = string
  description = "name of codebuild"
}

variable "codebuild_role_arn" {
  type        = string
  description = "Role that codebuild will assume"
}

variable "bucket_name" {
  type        = string
  description = "Bucket to store artifacts"
}

variable "fullrepositoryid" {
  type        = string
  description = "source code repository id"
}

variable "repository_location" {
  type        = string
  description = "https link of the source code repository"
}
variable "subnets" {
  type        = list(string)
  description = "build server subnets"
}

variable "vpc_id" {
  type        = string
  description = "build vpc"
}

variable "security_groups" {
  type        = list(string)
  description = "build security groups"
}

variable "env" {
  type        = string
  description = "environment variable"
}

variable "variables" {
  type = map(string)
}