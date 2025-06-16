resource "aws_security_group" "eks" {
    name = "${var.name}-eks"
    vpc_id = var.vpc_id
    tags = var.tags
}

resource "aws_security_group" "eks_node" {
    name = "${var.name}-eks-node"
    vpc_id = var.vpc_id
    tags = var.tags
}

resource "aws_security_group" "bastion_host" {
    name = "${var.name}-bastion-host"
    vpc_id = var.vpc_id
    tags = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "node_to_node" {
    security_group_id = aws_security_group.eks_node.id
    description = "Node groups to Node groups"
    referenced_security_group_id = aws_security_group.eks_node.id
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "node_to_cluster" {
    security_group_id = aws_security_group.eks.id
    description = "Node groups to cluster API"
    referenced_security_group_id = aws_security_group.eks_node.id
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "cluster_to_cluster" {
    security_group_id = aws_security_group.eks.id
    description = "EKS Cluster to EKS Cluster"
    referenced_security_group_id = aws_security_group.eks.id
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "cluster_to_node" {
    security_group_id = aws_security_group.eks_node.id
    description = "Cluster to node"
    referenced_security_group_id = aws_security_group.eks.id
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "bastion_to_cluster" {
    security_group_id = aws_security_group.bastion_host.id
    description = "Bastion to cluster"
    referenced_security_group_id = aws_security_group.eks.id
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "bastion_to_node" {
    security_group_id = aws_security_group.bastion_host.id
    description = "Bastion to node"
    referenced_security_group_id = aws_security_group.eks_node.id
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "bastion_to_everywhere" {
    security_group_id = aws_security_group.bastion_host.id
    description = "Bastion to everywhere"
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "eks_cluster_to_everywhere" {
    security_group_id = aws_security_group.eks.id
    description = "EKS Cluster to everywhere"
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "eks_node_to_everywhere" {
    security_group_id = aws_security_group.eks_node.id
    description = "EKS Node to everywhere"
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}