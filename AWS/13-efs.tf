resource "aws_efs_file_system" "eks" {
  creation_token = "eks-prod"

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true

  tags = {
    Name = "eks-prod"
  }
}

resource "aws_efs_mount_target" "zone-a" {
  file_system_id  = aws_efs_file_system.eks.id
  subnet_id       = aws_subnet.private-subnet-a.id
  security_groups = [aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id]
}

resource "aws_efs_mount_target" "zone-b" {
  file_system_id  = aws_efs_file_system.eks.id
  subnet_id       = aws_subnet.private-subnet-b.id
  security_groups = [aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id]
}
