# EKS Addons: VPC CNI, CoreDNS, kube-proxy
resource "aws_eks_addon" "vpc_cni" {
  cluster_name                  = aws_eks_cluster.eks_cluster.name
  addon_name                    = "vpc-cni"
  addon_version                 = var.vpc_cni_version
  service_account_role_arn      = aws_iam_role.eks_admin.arn

  # Conflict resolution settings
  resolve_conflicts_on_create   = "OVERWRITE"  # Options: OVERWRITE, PRESERVE
  resolve_conflicts_on_update   = "OVERWRITE"  # Options: OVERWRITE, PRESERVE

  configuration_values = jsonencode({
    env = {
      ENABLE_PREFIX_DELEGATION = "true"
    }
  })
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name                  = aws_eks_cluster.eks_cluster.name
  addon_name                    = "kube-proxy"
  addon_version                 = var.kube_proxy_version
  service_account_role_arn      = aws_iam_role.eks_admin.arn

  resolve_conflicts_on_create   = "OVERWRITE"
  resolve_conflicts_on_update   = "OVERWRITE"
}
