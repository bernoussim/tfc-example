provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.token
}

data "tfe_workspace" "nonp_ws1" {
  name         = "nonp-ws1"
  organization = "mehdiber"
}

resource "tfe_variable" "vpc_name" {
  key          = "vpc_id"
  value        = "vpc-0cf28dde1dec2bfff"
  category     = "terraform"
  workspace_id = data.tfe_workspace.nonp_ws1.id
  description  = "vpc id"
}

