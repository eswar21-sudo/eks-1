region         = "us-east-2"
cluster_name   = "dcli-tf-eks-cluster-v2"
vpc_cidr       = "10.13.0.0/16"
azs            = [ "us-east-2b", "us-east-2a"]
subnet_ids     = [ "subnet-0dc1f9b92bc35f353", "subnet-0a7d5385e67aeefb7" ]
cluster_version = "1.32"
node_group_name = "system-nodes"
node_role_arn  = "arn:aws:iam::577638384428:role/dcli-tst-eks-cluster-eks-node-role"
min_size        = 1
max_size        = 4
desired_size    = 3
instance_types  = ["t3.large"]
capacity_type   = "ON_DEMAND"
ami_type        = "AL2023_x86_64_STANDARD"
attach_primary_sg = "sg-093ed767662193185"
labels = {
  "nodegroup" = "system-nodes"
}
tags = {
  Environment = "dev"
  Owner       = "577638384428"
}

environment   = "dev"
