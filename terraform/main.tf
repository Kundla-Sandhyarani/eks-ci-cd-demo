terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.1"

  cluster_name    = "amazing-hiphop-wardrobe-v2"
  cluster_version = "1.33"
  vpc_id          = "vpc-0121b1a9ddb0ffbfe"
  subnet_ids      = ["subnet-0c980a59bca3f2bc9", "subnet-038b4cd5e678d4ae9"]

  enable_cluster_creator_admin_permissions = true
  create_cloudwatch_log_group = false

  eks_managed_node_groups = {
    default = {
      desired_size   = 1
      max_size       = 2
      min_size       = 1
      instance_types = ["t3.medium"]
    }
  }
}
