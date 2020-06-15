terraform {
  backend "s3" {
    key = "statefile.tfstate"
    region = "eu-west-1"
    bucket = "g-cloud-academy-terraform-backend"
    dynamodb_table = "terraform-state-locking"
  }
}
