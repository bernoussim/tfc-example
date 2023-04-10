resource "tfe_workspace" "dev_ws1" {
  name             = "dev-ws1"
  organization     = "mehdiber"
  trigger_patterns = ["/dev/ws1/*.tf"]
  vcs_repo {
    identifier                 = "bernoussim/tfc-example"
    branch                     = "master"
    github_app_installation_id = "ghain-bdeYvwZxSPuaXaKM"
  }
}

resource "tfe_variable" "vpc_name" {
  key          = "vpc_id"
  value        = "vpc-0ebbc4ffbff8c9689"
  category     = "terraform"
  workspace_id = tfe_workspace.dev_ws1.id
  description  = "vpc id"
}

resource "tfe_variable" "region" {
  key          = "AWS_REGION"
  value        = "us-east-1"
  category     = "env"
  description  = "aws region"
  workspace_id = tfe_workspace.my_workspace.id
}

resource "tfe_variable" "enable_aws_provider_auth" {
  workspace_id = tfe_workspace.dev_ws1.id

  key      = "TFC_AWS_PROVIDER_AUTH"
  value    = "true"
  category = "env"

  description = "Enable the Workload Identity integration for AWS."
}

resource "tfe_variable" "tfc_aws_role_arn" {
  workspace_id = tfe_workspace.dev_ws1.id

  key      = "TFC_AWS_RUN_ROLE_ARN"
  value    = "arn:aws:iam::082028366202:role/tfc-role"
  category = "env"

  description = "The AWS role arn runs will use to authenticate."
}