data "aws_ami" "ubuntu_sydney" {
  provider = aws.sydney

  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_singapore" {
  provider    = aws.singapore
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "sydney_ec2" {
  provider               = aws.sydney
  ami                    = data.aws_ami.ubuntu_sydney.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance_sydney.id]

  tags = {
    Name = "Example-terraform"
  }

  user_data = <<-EOF
                #!/bin/bash
                echo "Hi, Welcome to my webpage @ sydney..!" > index.html
                nohup busybox httpd -f -p ${var.web_server_port} &
                EOF

  user_data_replace_on_change = true
}
resource "aws_instance" "singapore_ec2" {
  provider               = aws.singapore
  ami                    = data.aws_ami.ubuntu_singapore.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance_singapore.id]

  tags = {
    Name = "Example-terraform"
  }

  user_data = <<-EOF
                #!/bin/bash
                echo "Hi, Welcome to my webpage @ singapore..!" > index.html
                nohup busybox httpd -f -p ${var.web_server_port} &
                EOF

  user_data_replace_on_change = true
}

resource "aws_security_group" "instance_sydney" {
  provider = aws.sydney
  name     = "tf-this-instance"

  ingress {
    from_port   = var.web_server_port
    to_port     = var.web_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instance_singapore" {
  provider = aws.singapore
  name     = "tf-this-instance"

  ingress {
    from_port   = var.web_server_port
    to_port     = var.web_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}