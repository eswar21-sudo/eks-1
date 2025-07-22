# EKS Cluster
provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_admin.arn  # Use the new admin IAM role

  vpc_config {
    subnet_id              = var.public_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids = concat(
      [aws_security_group.eks_sg.id],   # EKS SG
      [var.security_group_id]    # Join with master security group
    )
  }

  version = var.kubernetes_version

  tags = {
    Name        = "${var.cluster_name}-eks-cluster"
    Environment                       = "var.environment"
    Project                           = "var.project"
    Owner                             = "var.owner"
    CostCenter                        = "CC12345"
    "deks.amazonaws.com/eks-managed"   = "true"
    "KubernetesCluster"               = var.cluster_name
    "aws:eks:cluster-name"            = var.cluster_name
    "k8s.io/cluster-autoscaler/enabled" = "true"
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "true"
  }
}

# IAM Role for EKS Cluster admin
resource "aws_iam_role" "eks_admin" {
  name = "${var.cluster_name}-admin-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com",
                    "ec2.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
})

  tags = {
    Name = "${var.cluster_name}-admin-role"
    KubernetesCluster = "var.cluster_name"
  }
}

# IAM Role Policy Attachment

# Attach Administrative Policies
resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.eks_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# ===========================
# Attach SSM Policy for Remote Access
# ===========================

resource "aws_iam_role_policy_attachment" "eks_ssm_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.eks_admin.name
}

# ===========================
# Attach Existing Policies
# ===========================

resource "aws_iam_role_policy_attachment" "eks_node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_admin.name
}

resource "aws_iam_role_policy_attachment" "eks_node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_admin.name
}

resource "aws_iam_role_policy_attachment" "eks_node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_admin.name
}

# Security Group for EKS Cluster
resource "aws_security_group" "eks_sg" {
  name        = "${var.cluster_name}-eks-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.cluster_name}-eks-sg"
    Environment = "production"
  }
}

# Rule to allow all traffic between EKS and master SG
resource "aws_security_group_rule" "eks_to_master_sg" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_sg.id
  source_security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "master_sg_to_eks" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = aws_security_group.eks_sg.id
}
