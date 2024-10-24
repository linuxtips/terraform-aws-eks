# LINUXtips-eks  terraform-aws-eks

## Description

This module creates a fully functional Amazon EKS cluster with associated resources.

## Usage

```hcl
module "linuxtips_eks" {
  source = "./linuxtips-eks"

  name                    = "my-cluster"
  region                  = "eu-west-1"
  vpc_cidr_block          = "10.0.0.0/16"
  public_subnet_cidrs     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  private_subnet_cidrs    = ["10.0.128.0/19", "10.0.160.0/19", "10.0.192.0/19"]
  availability_zones      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  cluster_name            = "my-cluster"
  node_instance_types     = ["c5.large"]
  node_group_desired_size = 2
  node_group_max_size     = 6
  node_group_min_size     = 2
  tags = {
    Environment = "production"
    Team        = "Platform Engineering"
  }
}
```

## Inputs

- `name`: Name of the EKS cluster.
- `region`: AWS region.
- `vpc_cidr_block`: CIDR block for the VPC.
- `public_subnet_cidrs`: List of CIDR blocks for public subnets.
- `private_subnet_cidrs`: List of CIDR blocks for private subnets.
- `availability_zones`: List of availability zones for the subnets.
- `cluster_name`: Name of the EKS cluster.
- `node_instance_types`: List of instance types for the worker nodes.
- `node_group_desired_size`: Desired size of the node group.
- `node_group_max_size`: Maximum size of the node group.
- `node_group_min_size`: Minimum size of the node group.
- `tags`: Tags to apply to the resources.

## Outputs

- `eks_cluster_id`: ID of the EKS cluster.
- `eks_cluster_endpoint`: Endpoint of the EKS cluster.
- `eks_cluster_certificate_authority`: Certificate authority data for the cluster.
- `eks_cluster_oidc_issuer_url`: OIDC issuer URL of the EKS cluster.
- `eks_node_group_role_arn`: ARN of the node group IAM role.
- `eks_autoscaler_role_arn`: ARN of the cluster autoscaler IAM role.
- `eks_cluster_oidc_provider_arn`: ARN of the OIDC provider for the EKS cluster.
- `eks_cluster_oidc_provider_id`: ID of the OIDC provider for the EKS cluster.

## Notes

- The module creates a VPC, subnets, and other necessary resources in the specified region.
- The module creates a node group with the specified instance types and autoscaling configuration.
- The module creates an IAM role for the node group and a cluster autoscaler role.
- The module creates an OIDC provider for the EKS cluster.
- The module creates an IAM policy for the EKS cluster autoscaler.
- The module creates an IAM role for the EKS cluster autoscaler.
- The module creates an IAM policy for the EKS cluster autoscaler.

## Terraform State

The Terraform state is stored in an S3 bucket and a DynamoDB table. The bucket and table are created in the root module.

## Terraform State Locking

The Terraform state is locked using a DynamoDB table. The table is created in the root module.

