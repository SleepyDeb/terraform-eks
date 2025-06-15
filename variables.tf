variable "backend_bucket" {
  description = "AWS terraform backend bucket"
  type        = string
  default     = "terraform-backend-846173919647-eu-west-1"
}

variable "backend_key" {
  description = "AWS terraform backend object key"
  type        = string
  default     = "terraform-eks"
}

variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-west-1"
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "eks-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "vpc_public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "node_group_name" {
  description = "Name for the EKS node group"
  type        = string
  default     = "default-node-group"
}

variable "node_group_instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "node_group_desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_group_max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
        Architecture = "Sample Architecture"
  }
}