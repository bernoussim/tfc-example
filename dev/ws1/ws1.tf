provider "tfe" {
  hostname = "app.terraform.io"
  token    = "Cl9OSvegbn2Rzg.atlasv1.yrUTyWIUyxIgTEpOZY0X8FIzTxCJL8HWdZB4DpabP4SXANdCxSprH86QNqWhOacJYEU"
}

data "tfe_workspace" "dev_ws1" {
  name         = "dev-ws1"
  organization = "mehdiber"
}

resource "tfe_variable" "vpc_name" {
  key          = "vpc_id"
  value        = "vpc-0ebbc4ffbff8c9689"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev_ws1.id
  description  = "vpc id"
}

