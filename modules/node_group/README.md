# Node Group Module

This module provisions an AWS EKS managed node group and the necessary IAM role.

## Usage

```hcl
module "node_group" {
  source             = "./modules/node_group"
  cluster_name       = module.eks.cluster_name
  node_group_name    = "default-node-group"
  subnet_ids         = module.vpc.private_subnet_ids
  instance_types     = ["t3.medium"]
  desired_capacity   = 2
  min_capacity       = 1
  max_capacity       = 3
  tags               = { Environment = "dev" }
}
```

## Variables

- `cluster_name` (string): Name of the EKS cluster.
- `node_group_name` (string): Name of the EKS node group.
- `subnet_ids` (list(string)): List of subnet IDs for the node group.
- `instance_types` (list(string)): List of EC2 instance types for the node group.
- `desired_capacity` (number): Desired number of worker nodes.
- `min_capacity` (number): Minimum number of worker nodes.
- `max_capacity` (number): Maximum number of worker nodes.
- `tags` (map(string)): Tags to apply to all resources.

## Outputs

- `node_group_arn`: The ARN of the EKS node group.
- `node_group_role_arn`: The ARN of the IAM role used by the node group.