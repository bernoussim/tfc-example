terraform {
  backend "remote" {
    organization = "mehdiber"
    workspaces {
      prefix = "eks-"
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_s3_bucket" "b" {
  bucket = "tf-test-bucket-${data.aws_caller_identity.current.account_id}"
}
