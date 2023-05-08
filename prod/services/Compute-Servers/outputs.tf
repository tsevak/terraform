output "sydney_Ec2_Ip" {
  value       = aws_instance.sydney_ec2.public_ip
  description = "Public IP address of sydney web server"
}

output "singapore_Ec2_Ip" {
  value       = aws_instance.singapore_ec2.public_ip
  description = "Public IP address of singapore web server"
}