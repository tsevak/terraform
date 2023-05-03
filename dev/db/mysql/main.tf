resource "aws_db_instance" "this"{
  identifier_prefix   = "tf-dcl-db"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "dcl_dev_db"

  username = var.username
  password = var.password
}