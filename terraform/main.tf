provider "aws" {
  region = "ap-southeast-2"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-ci-cd-cluster"
  cluster_version = "1.27"
  subnets         = ["subnet-0c980a59bca3f2bc9", "subnet-038b4cd5e678d4ae9"]
  vpc_id          = "vpc-0121b1a9ddb0ffbfe"
}
