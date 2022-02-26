output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}
output "private_subnets_id" {
  value = aws_subnet.private_subnet.*.id
}

output "public_subnets_id" {
  value = aws_subnet.public_subnet.*.id
}