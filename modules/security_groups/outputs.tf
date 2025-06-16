output "eks_security_group_id" {
    description = "EKS Cluster Security Group"
    value = aws_security_group.eks.id
}

output "eks_node_security_group_id" {
    description = "EKS Cluster Node Security Group"
    value = aws_security_group.eks_node.id
}

output "bastion_host_security_group_id" {
    description = "Bastion Host Security Group"
    value = aws_security_group.bastion_host.id
}
