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

resource "aws_iam_instance_profile" "bastion" {
  name = "${var.host_name}-instance-profile"
  role = var.role_name
}

resource "aws_instance" "default" {
  ami = data.aws_ami.this.id
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ var.security_group_id ]
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.bastion.name
  user_data = templatefile("${path.module}/scripts/cloud-init.yaml.tftpl", {
    eks_cluster_name = var.eks_cluster_name
    eks_cluster_role = var.eks_role_arn
  })
  tags = merge(var.tags, {
    name = var.host_name
  })
}
