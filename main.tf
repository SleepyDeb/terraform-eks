terraform {
  required_version = ">= 1.3.0"
  backend "s3" {

  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  name   = var.vpc_name
  cidr   = var.vpc_cidr
  azs    = var.vpc_azs
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  tags   = var.tags
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  cluster_version = var.cluster_version
  tags            = var.tags
}

module "node_group" {
  source             = "./modules/node_group"
  cluster_name       = module.eks.cluster_name
  node_group_name    = var.node_group_name
  subnet_ids         = module.vpc.private_subnet_ids
  instance_types     = var.node_group_instance_types
  desired_capacity   = var.node_group_desired_capacity
  min_capacity       = var.node_group_min_capacity
  max_capacity       = var.node_group_max_capacity
  tags               = var.tags
}
