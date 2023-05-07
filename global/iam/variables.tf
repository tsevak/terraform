variable "user" {
  description = "Add users to IAM for aws Access"
  type        = list(string)
  default     = ["neo", "scott", "ryan"]
}