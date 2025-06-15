vpc_name = "dev-terraform-eks"
cluster_name = "dev-terraform-eks"
node_group_name = "dev-terraform-eks"
cluster_version = "1.31"
node_group_min_capacity = 1
node_group_max_capacity = 3
node_group_desired_capacity = 1
tags = {
    Environment = "Development"
    Stack = "Terraform EKS"
}