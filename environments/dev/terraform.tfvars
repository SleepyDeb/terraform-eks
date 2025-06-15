region = "eu-west-1"
vpc_cidr = "10.0.0.0/16"
vpc_private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_azs = ["eu-west-1a", "eu-west-1b"]
node_group_instance_types = ["t3.small"]
cluster_version = "1.31"
vpc_name = "dev-terraform-eks"
cluster_name = "dev-terraform-eks"
node_group_name = "dev-terraform-eks"
node_group_min_capacity = 1
node_group_max_capacity = 3
node_group_desired_capacity = 1
tags = {
    Environment = "Development"
    Stack = "Terraform EKS"
}