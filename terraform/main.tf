terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = ">=5.0" }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.1"

  cluster_name    = "amazing-hiphop-wardrobe"
  cluster_version = "1.33"
  vpc_id          = "vpc-0121b1a9ddb0ffbfe"
  subnet_ids      = ["subnet-0c980a59bca3f2bc9", "subnet-038b4cd5e678d4ae9"]

  create_cloudwatch_log_group = false  # Reuse existing log group

  # For IRSA and Node Group configuration:
  manage_cluster_iam = false  # disable auto IAM creation
  manage_aws_auth    = true

  # Use built-in node_groups block instead of eks_managed_node_groups
  node_groups = {
    default = {
      desired_capacity = 1
      min_capacity     = 1
      max_capacity     = 2
      instance_types   = ["t3.medium"]
    }
  }
}
