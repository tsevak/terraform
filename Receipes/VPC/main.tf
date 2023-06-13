module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  public_subnets  = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ssh_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "ssh-access"
  description         = "Security group for ssh access with 22 port open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
}


###### just testing EC2 instance on this newly created VPC
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "test-machine"

  instance_type               = "t2.micro"
  key_name                    = "syd"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.ssh_sg.security_group_id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}