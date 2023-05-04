provider "aws" {
  region = "ap-southeast-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/Webserver_Cluster"

  cluster_name           = "webserver-dev"
  db_remote_state_bucket = "tf-state-dcl-2023"
  db_remote_state_key    = "dev/db/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 5
}
