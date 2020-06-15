provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}


terraform {
  backend "remote" {
    organization = "g-cloud-academy"

    workspaces {
      name = "terraform-test"
    }
  }
}

resource "aws_s3_bucket" "terraform_s3_bucket" {
    bucket = "g-cloud-academy-terraform-github-3"
}