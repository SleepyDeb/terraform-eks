output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.this.arn
}

output "node_group_role_arn" {
  description = "The ARN of the IAM role used by the node group"
  value       = aws_iam_role.node_group.arn
}