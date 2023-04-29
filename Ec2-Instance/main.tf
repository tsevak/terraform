provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "this" {
    ami = "ami-0f6ad051716c81af1"         # AWS LINUX
    instance_type = "t2.micro"

    tags = {
      Name = "Example-terraform"
    }
}