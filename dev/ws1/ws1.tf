provider "tfe" {
  hostname = var.tfc_hostname
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

