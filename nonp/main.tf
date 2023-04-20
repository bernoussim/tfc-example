data "aws_caller_identity" "current" {}

resource "aws_instance" "this" {
  ami           = var.ami_version
  instance_type = var.instance_type
}
