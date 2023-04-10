terraform {
  backend "remote" {
    organization = "mehdiber"
    workspaces {
      prefix = "nonp-"
    }
  }
}

data "aws_caller_identity" "current" {}

module "tfc_workspace" {
  source = "./ws1"
  token  = var.token
}

resource "aws_s3_bucket" "b" {
  bucket = "tf-test-bucket-${data.aws_caller_identity.current.account_id}-${module.tfc_workspace.vpc_id}"
}

data "aws_secretsmanager_secret" "test" {
  name = "test"
}
