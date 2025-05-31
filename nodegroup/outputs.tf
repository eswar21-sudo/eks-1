# Node group module outputs.tf

output "cluster_name" {
  description = "EKS Cluster name"
  value       = var.cluster_name
}

output "node_group_name" {
  description = "EKS node group name"
  value       = var.node_group_name
}

output "node_instance_types" {
  description = "Instance types used in the node group"
  value       = var.instance_types
}

output "node_group_arn" {
  description = "ARN of the EKS node group"
  value       = aws_eks_node_group.this.arn
}

output "vpc_cidr" {
  description = "vpc ip cidr"
  value       = var.vpc_cidr
}

output "subnet_ids" {
  description = "list of subnet ids"
  value       = var.subnet_ids
}

output "availibility_zones" {
  description = "list of azs"
  value       = var.azs
}

output "attach_primary_sg" {
  description = "primary sg for eks endpoints"
  value       = var.attach_primary_sg
}

output "cluster_version" {
  description = "Version of cluster"
  value       = var.cluster_version
}

output "region" {
  description = "region of cluster"
  value       = var.region
}
