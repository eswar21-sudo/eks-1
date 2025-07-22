
# EKS Cluster Configuration
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
}

variable "public_subnet_id" {
  description = "List of existing subnet IDs"
  type        = list(string)
}

#variable "availability_zones" {
#  description = "List of availability zones"
#  type        = list(string)
}

# Addon versions
variable "vpc_cni_version" {
  description = "Version of the VPC CNI addon"
  type        = string
  default     = "v1.19.3-eksbuild.1"
}

variable "kube_proxy_version" {
  description = "Version of the kube-proxy addon"
  type        = string
  default     = "v1.32.0-eksbuild.2"
}

# Tags
variable "environment" {
  description = "env, deplyed into"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "project assigned"
  type        = string
}

variable "owner" {
  description = "AWS account ID owning cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.32"
}

variable "security_group_id" {
  description = "Master security group ID to join EKS SGs with"
  type        = string
}
