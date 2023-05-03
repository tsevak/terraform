terraform {
  backend "s3" {
    bucket = "tf-state-dcl-2023"
    key    = "dev/services/Webserver_Cluster/terraform.tfstate"
    region = "ap-southeast-2"

    dynamodb_table = "tf-state-dcl-lock-2023"
    encrypt        = true
  }
}