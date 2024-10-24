resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.name}-node-group"
  node_role_arn   = aws_iam_role.node_group_role.arn

  subnet_ids = aws_subnet.private_subnets[*].id

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  instance_types = var.node_instance_types
  capacity_type  = var.node_capacity_type
  ami_type       = var.node_ami_type

  labels = var.node_labels

  tags = merge(var.tags, { Name = "${var.name}-eks-node-group" })

  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.node_group_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_group_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_group_AmazonEC2ContainerRegistryReadOnly,
  ]
}
