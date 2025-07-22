
output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

# Display the EKS admin role ARN
output "eks_admin_role_arn" {
  description = "IAM Role ARN for EKS Admin"
  value       = aws_iam_role.eks_admin.arn
}

# Display the EKS security group ID
output "eks_security_group_id" {
  description = "EKS Cluster Security Group ID"
  value       = aws_security_group.eks_sg.id
}

# Display the master security group ID
output "master_security_group_id" {
  description = "Master Security Group ID"
  value       = var.security_group_id
}
