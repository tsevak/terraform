output "address" {
  value       = aws_db_instance.this.address
  description = "Database connection endpoint"
}