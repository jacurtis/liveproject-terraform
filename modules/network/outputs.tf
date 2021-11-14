output "vpc_id" {
  description = "The ID for the primary VPC created for the network"
  value = aws_vpc.primary.id
}