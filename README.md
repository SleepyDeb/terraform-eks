<!-- Badges -->
<p align="center">
  <a href="https://github.com/SleepyDeb/terraform-eks/actions/workflows/terraform.yml">
    <img src="https://img.shields.io/badge/Development--Deployment-Success-brightgreen?style=for-the-badge&logo=github-actions&label=Development%20Status" alt="Development Deployment Status">
  </a>
</p>

# Terraform AWS EKS Platform

A robust, modular, and production-ready infrastructure-as-code solution for deploying and managing Amazon EKS clusters using Terraform, with automated CI/CD via GitHub Actions and secure access patterns.

---

## Overview

- **Cloud Platform:** [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/)
- **Infrastructure as Code:** [Terraform](https://www.terraform.io/)
- **CI/CD Automation:** [GitHub Actions](https://github.com/features/actions)
- **Security:** Bastion host with AWS SSM Session Manager, least-privilege IAM, and network segmentation
- **Multi-Stage Deployments:** Isolated development and production environments with separate state and configuration

---

## Multi-Stage & Multi-Environment Deployment

This project implements a clear separation between **development** and **production** environments, each with its own backend state and configuration:

```
environments/
  ├── development/
  │   ├── backend.hcl
  │   └── terraform.tfvars
  └── production/
      ├── backend.hcl
      └── terraform.tfvars
```

- **State Isolation:** Each environment maintains its own Terraform state, ensuring changes in one do not affect the other.
- **Configuration Separation:** Environment-specific variables and backends enable safe, independent deployments and testing.

---

## Modular Architecture

The infrastructure is organized into reusable, composable modules for maintainability and scalability:

```
modules/
  ├── bastion_host/      # Secure access via SSM
  ├── roles/             # IAM roles and policies
  └── security_groups/   # Network segmentation and security
```

- **Bastion Host Module:** Provisions a hardened bastion host accessible only via [AWS SSM Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html), eliminating the need for public SSH and reducing attack surface.
- **Roles Module:** Manages IAM roles and policies with least-privilege principles.
- **Security Groups Module:** Defines granular network access controls for all resources.

---

## Secure Bastion Host Access

- **No Public SSH:** Bastion host is not exposed to the internet.
- **SSM Session Manager:** Access is granted via AWS SSM, providing auditability, session logging, and fine-grained access control.
- **Security Benefits:** Minimizes attack vectors, enforces MFA, and supports compliance requirements.

---

## CI/CD Pipeline (GitHub Actions)

Automated workflows streamline infrastructure management:

- **Plan & Apply:** On pull requests and merges, GitHub Actions run `terraform plan` and `terraform apply` for the targeted environment.
- **Environment Promotion:** Changes are promoted from development to production via controlled workflows.
- **Automated Validation:** Linting, security checks, and drift detection are integrated into the pipeline.
- **Status Badges:** Deployment status for each environment is displayed at the top of this README.

---

## Quick Start

```bash
# Initialize Terraform
terraform init -backend-config=environments/development/backend.hcl

# Plan changes for development
terraform plan -var-file=environments/development/terraform.tfvars

# Apply changes to development
terraform apply -var-file=environments/development/terraform.tfvars
```

---

## Directory Structure

```
.
├── environments/
│   ├── development/
│   └── production/
├── modules/
│   ├── bastion_host/
│   ├── roles/
│   └── security_groups/
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.hcl
└── README.md
```

---

## License

Distributed under the MIT License.