# EKS Module

This module provisions an AWS EKS cluster and the necessary IAM role.

## Usage

```hcl
module "eks" {
  source          = "./modules/eks"
  cluster_name    = "my-eks-cluster"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  cluster_version = "1.29"
  tags            = { Environment = "dev" }
}
```

## Variables

- `cluster_name` (string): Name of the EKS cluster.
- `vpc_id` (string): VPC ID for the EKS cluster.
- `subnet_ids` (list(string)): List of subnet IDs for the EKS cluster.
- `cluster_version` (string): Kubernetes version for the EKS cluster.
- `tags` (map(string)): Tags to apply to all resources.

## Outputs

- `cluster_name`: The name of the EKS cluster.
- `cluster_endpoint`: The endpoint for the EKS cluster.
- `kubeconfig`: Kubeconfig file content for the EKS cluster.
- `cluster_security_group_id`: Security group ID associated with the EKS cluster.