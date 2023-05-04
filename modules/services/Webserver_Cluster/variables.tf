variable "web_server_port" {
  description = "Web Server Port no"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "Name of cluster"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "S3 bucket name for DB remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "Path for DB remote state in S3"
  type        = string
}

variable "instance_type" {
  description = "Type of Ec2 instance"
  type        = string
}

variable "min_size" {
  description = "Minimum no of Ec2 instances"
  type        = number
}

variable "max_size" {
  description = "Maximum no of Ec2 instances"
  type        = number
}