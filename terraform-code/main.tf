provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}


terraform {
  backend "remote" {
    organization = "g-cloud-academy"
    hostname = "app.terraform.io"
    workspaces {
      name = "terraform-test"
    }
    token = "1h9uYPXiXvrbsw.atlasv1.GuXJeUvQSNHS0OwTcpYpTYfppkTEvu1TdojiFAnvS1wBpxX75BXre9hdaAnJZilnN18"
  }
}

resource "aws_s3_bucket" "terraform_s3_bucket" {
    bucket = "g-cloud-academy-terraform-github-4"
    cors_rule {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "POST", "GET"]
      allowed_origins = ["*"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
  }
}