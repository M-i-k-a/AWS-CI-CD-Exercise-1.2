variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

#variable "tf_token" {
#  type    = string
#}

variable "bucket_name" {
  type    = string
  default = "g-cloud-academy-terraform-backend"
}

variable "table_name" {
  type    = string
  default = "terraform-state-locking"
}