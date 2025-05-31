region         = "us-east-2"
cluster_name   = "dcli-coredemo"
vpc_cidr       = "10.30.0.0/16"
azs            = ["us-east-2b", "us-east-2a"]
subnet_ids     = ["subnet-01d944248dceb8562", "subnet-0b76dae2e5682a985"]
cluster_version = "1.32"
node_group_name = "system-nodes"
node_role_arn  = "arn:aws:iam::582683034382:role/EKS-Node-Role"
min_size        = 1
max_size        = 4
desired_size    = 3
instance_types  = ["t3.large"]
capacity_type   = "ON_DEMAND"
ami_type        = "AL2023_x86_64_STANDARD"
attach_primary_sg = "sg-0b9edff3bd9705620"
labels = {
  "nodegroup" = "system-nodes"
}
tags = {
  Environment = "dev"
  Owner       = "582683034382"
}

environment   = "dev"
