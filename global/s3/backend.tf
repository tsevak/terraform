terraform {
  backend "s3" {
    bucket = "tf-state-dcl-2023"
    key    = "global/s3/terraform.tfstate"
    region = "ap-southeast-2"

    dynamodb_table = "tf-state-dcl-lock-2023"
    encrypt        = true

  }
}