provider "aws" {
  region = "ap-south-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-ci-cd-cluster"
  cluster_version = "1.27"
  subnets         = ["subnet-abc", "subnet-def"]
  vpc_id          = "vpc-xyz"
}
