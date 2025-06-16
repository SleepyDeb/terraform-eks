data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "default" {
  ami = data.aws_ami.this.id
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ var.security_group_id ]
  associate_public_ip_address = false
  # user_data = replace(file("./scripts/cloud-init.yaml"), "_EKS_CLUSTER_NAME_", var.eks_cluster_name)
  tags = merge(var.tags, {
    name = var.host_name
  })
}
