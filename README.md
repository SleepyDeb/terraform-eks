# Terraform AWS EKS Cluster Project

This project provisions an AWS Elastic Kubernetes Service (EKS) cluster using Terraform. It is modular, parameterized, and ready for production use.

## Project Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── README.md
└── modules/
    ├── vpc/
    ├── eks/
    └── node_group/
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0
- AWS account and credentials with sufficient permissions (EKS, VPC, IAM, EC2)
- Recommended: remote state backend (e.g., S3 with DynamoDB locking) for team use

## Usage

1. **Clone the repository** and change into the directory.
2. **Configure your AWS credentials** (via environment variables, AWS CLI, or shared credentials file).
3. **Review and customize variables** in `variables.tf` or via `terraform.tfvars`.
4. **Initialize Terraform:**
   ```
   terraform init
   ```
5. **Review the execution plan:**
   ```
   terraform plan
   ```
6. **Apply the configuration (provisions resources):**
   ```
   terraform apply
   ```
   > **Note:** This project is provided for demonstration and planning. Do **not** apply in a production environment without review.

## Variables

See [`variables.tf`](variables.tf:1) for all configurable options, including region, cluster name, VPC and node group settings, and tags.

## Outputs

See [`outputs.tf`](outputs.tf:1) for available outputs, such as the EKS cluster endpoint, kubeconfig, VPC and subnet IDs, and node group ARNs.

## Modules

- [`modules/vpc`](modules/vpc): VPC and networking resources
- [`modules/eks`](modules/eks): EKS cluster and IAM roles
- [`modules/node_group`](modules/node_group): Managed node group(s)

## Security & Best Practices

- Follows AWS least-privilege IAM recommendations.
- All resources are tagged for cost allocation and management.
- Versions are pinned for reproducibility.
- Use remote state for team collaboration.

## Note

This project only provisions infrastructure. No workloads or applications are deployed by default. **Deployment is not performed automatically.**