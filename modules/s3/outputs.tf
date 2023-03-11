output "codepipeline-bucket-arn" {
  value = aws_s3_bucket.codepipeline_bucket.arn
}

output "codepipeline-bucket-name" {
  value = aws_s3_bucket.codepipeline_bucket.id
}