provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "this" {
  ami                    = "ami-03d0155c1ef44f68a" # Ubuntu Server 20.04 LTS
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "Example-terraform"
  }

  user_data = <<-EOF
                #!/bin/bash
                echo "Hi, Welcome to my webpage..!" > index.html
                nohup busybox httpd -f -p ${var.web_server_port} &
                EOF

  user_data_replace_on_change = true
}

resource "aws_security_group" "instance" {
  name = "tf-this-instance"

  ingress {
    from_port   = var.web_server_port
    to_port     = var.web_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}