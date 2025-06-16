terraform {
  required_version = ">= 1.3.0"
  backend "s3" { }
}

# IAM Roles Module
module "roles" {
  source = "./modules/roles"
  name   = var.deployment_name
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "${var.deployment_name}-${var.vpc_name}"
  cidr   = var.vpc_cidr
  azs    = var.vpc_azs
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  tags   = var.tags
  enable_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "security_groups" {
  source = "./modules/security_groups"
  name = var.deployment_name
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"  
  version = "~> 20.31"

  cluster_name = "${var.deployment_name}-${var.cluster_name}"
  cluster_version = var.cluster_version
  iam_role_arn = module.roles.eks_role_arn
  # Optional
  cluster_endpoint_public_access = false

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_security_group_id = module.security_groups.eks_security_group_id
  node_security_group_id = module.security_groups.eks_node_security_group_id

  eks_managed_node_group_defaults = {
    instance_types = var.node_group_instance_types
    iam_role_arn = module.roles.eks_node_role_arn
  }

  authentication_mode = "API_AND_CONFIG_MAP"
  
  # eks_managed_node_groups = {
  #   default = {
  #     instance_types = var.node_group_instance_types
      
  #     min_size     = var.node_group_min_capacity
  #     max_size     = var.node_group_max_capacity
  #     desired_size = var.node_group_desired_capacity
  #   }
  # }
  tags = var.tags  
}

module "bastion-host" {
  source = "./modules/bastion_host"
  eks_cluster_name = module.eks.cluster_name
  host_name = "${var.deployment_name}-bh"
  subnet_id = module.vpc.private_subnets[0]
  security_group_id = module.security_groups.bastion_host_security_group_id
  tags = var.tags
  role_name = module.roles.bastion_role_name
}