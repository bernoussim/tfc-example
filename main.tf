terraform {
  backend "remote" {
    organization = "mehdiber"
    workspaces {
      prefix = "eks-"
    }
  }
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}
