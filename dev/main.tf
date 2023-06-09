data "aws_caller_identity" "current" {}

module "tfc_workspace" {
  source = "./ws1"
  token  = var.token
}

resource "aws_s3_bucket" "b" {
  bucket = "tf-test-bucket-${data.aws_caller_identity.current.account_id}-${module.tfc_workspace.vpc_id}"
}
