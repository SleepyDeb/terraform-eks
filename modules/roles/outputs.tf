output "bastion_role_arn" {
  description = "ARN of the Bastion host IAM role"
  value       = aws_iam_role.bastion.arn
}

output "bastion_role_name" {
  description = "Name of the Bastion host IAM role"
  value       = aws_iam_role.bastion.name
}

output "eks_role_arn" {
  description = "ARN of the EKS control plane IAM role"
  value       = aws_iam_role.eks.arn
}

output "eks_role_name" {
  description = "Name of the EKS control plane IAM role"
  value       = aws_iam_role.eks.name
}

output "eks_node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = aws_iam_role.eks_node.arn
}

output "eks_node_role_name" {
  description = "Name of the EKS node IAM role"
  value       = aws_iam_role.eks_node.name
}
