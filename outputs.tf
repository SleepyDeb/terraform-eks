# output "cluster_endpoint" {
#   description = "EKS cluster endpoint"
#   value       = module.eks.cluster_endpoint
# }

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

# output "node_group_arn" {
#   description = "EKS node group ARN"
#   value       = module.node_group.node_group_arn
# }

# output "node_group_role_arn" {
#   description = "IAM role ARN for the node group"
#   value       = module.node_group.node_group_role_arn
# }