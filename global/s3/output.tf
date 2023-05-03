output "s3_bucket_arn" {
  value       = aws_s3_bucket.tf_state.arn
  description = "Arn of S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.tf-locks.name
  description = "Name of Dynamodb table"
}