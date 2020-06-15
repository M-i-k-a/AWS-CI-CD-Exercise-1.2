provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}

#terraform {
#  backend "remote" {
#    organization = "g-cloud-academy"
#    hostname = "app.terraform.io"
#    workspaces {
#      name = "terraform-test"
#    }
#    token = var.tf_token
#  }
#}


resource "aws_s3_bucket" "terraform_state" {

  bucket = "g-cloud-academy-terraform-backend"

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_state_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "terraform_s3_bucket" {
    bucket = "g-cloud-academy-terraform-github-5"
    cors_rule {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "POST", "GET"]
      allowed_origins = ["*"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
  }
}