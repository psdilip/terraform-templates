output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline-role.arn
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild-role.arn
}