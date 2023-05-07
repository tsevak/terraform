output "all_users" {
  value       = aws_iam_user.this
  description = "AWS Users"
}

output "user_Arns" {
    value = values(aws_iam_user.this)[*].arn
}