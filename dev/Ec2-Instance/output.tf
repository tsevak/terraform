output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP address of web server"
}