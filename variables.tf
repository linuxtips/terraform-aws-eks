variable "name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.128.0/19", "10.0.160.0/19", "10.0.192.0/19"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "endpoint_private_access" {
  description = "Whether the EKS cluster endpoint should be private"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the EKS cluster endpoint should be public"
  type        = bool
  default     = false
}

variable "node_group_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 5
}

variable "node_group_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "node_instance_types" {
  description = "List of instance types for worker nodes"
  type        = list(string)
  default     = ["c5.large"]
}

variable "node_capacity_type" {
  description = "Capacity type for worker nodes (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "node_labels" {
  description = "Key-value mapping of labels for the node group"
  type        = map(string)
  default = {
    role = "general"
  }
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "staging"
}

variable "team" {
  description = "Team"
  type        = string
}

variable "project" {
  description = "Project"
  type        = string
}

variable "node_ami_type" {
  description = "AMI ID for worker nodes"
  type        = string
  default     = "AL2_x86_64"
}
