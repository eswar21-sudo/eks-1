# Node group module variables.tf

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "node_group_name" {
  description = "Node group name"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role for the node group"
  type        = string
}

variable "vpc_cidr" {
  description = "vpc ip cidr block"
  type        = string
}

variable "azs" {
  description = "availibility zones"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Id of subnets"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum number of nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes"
  type        = number
}

variable "desired_size" {
  description = "Desired number of nodes"
  type        = number
}

variable "instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
}

variable "capacity_type" {
  description = "Capacity type (ON_DEMAND or SPOT)"
  type        = string
}

variable "ami_type" {
  description = "AMI type"
  type        = string
}

variable "tags" {
  description = "Tags for the node group"
  type        = map(string)
}

variable "labels" {
  description = "labels for the node group"
  type        = map(string)
}

variable "attach_primary_sg" {
  description = "primary sg for eks endpoints"
  type        = string
  default     = "sg-093ed767662193185"
}

variable "cluster_version" {
  description = "version of the cluster"
  type        = string
  default     = 1.32
}

variable "region" {
  description = "cluster region"
  type        = string
  default     = "us-east-2"
}

variable "environment" {
  description = "environment of the cluster"
  type        = string
  default     = "dev"
}
