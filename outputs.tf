output "eks_cluster_id" {
  description = "ID of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_certificate_authority" {
  description = "Certificate authority data for the cluster"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "eks_cluster_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_node_group_role_arn" {
  description = "ARN of the node group IAM role"
  value       = aws_iam_role.node_group_role.arn
}

output "eks_autoscaler_role_arn" {
  description = "ARN of the cluster autoscaler IAM role"
  value       = aws_iam_role.autoscaler_role.arn
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private_subnets[*].id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main_vpc.id
}
