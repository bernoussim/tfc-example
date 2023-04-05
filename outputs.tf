output "vpc_arn" {
  value = data.aws_vpc.selected.arn
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}
