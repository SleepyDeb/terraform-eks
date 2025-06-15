# VPC Module

This module provisions a VPC, public subnets, and private subnets for use with an EKS cluster.

## Usage

```hcl
module "vpc" {
  source          = "./modules/vpc"
  name            = "eks-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  tags            = { Environment = "dev" }
}
```

## Variables

- `name` (string): Name for the VPC.
- `cidr` (string): CIDR block for the VPC.
- `azs` (list(string)): List of availability zones.
- `public_subnets` (list(string)): List of public subnet CIDRs.
- `private_subnets` (list(string)): List of private subnet CIDRs.
- `tags` (map(string)): Tags to apply to all resources.

## Outputs

- `vpc_id`: The ID of the VPC.
- `public_subnet_ids`: List of public subnet IDs.
- `private_subnet_ids`: List of private subnet IDs.