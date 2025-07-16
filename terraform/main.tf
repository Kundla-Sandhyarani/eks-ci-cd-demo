module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.37.1"

  cluster_name    = "amazing-hiphop-wardrobe"
  cluster_version = "1.33"

  subnet_ids      = ["subnet-0c980a59bca3f2bc9", "subnet-038b4cd5e678d4ae9"]
  vpc_id          = "vpc-0121b1a9ddb0ffbfe"

  # Add these lines ↓↓↓
  cloudwatch_log_group_name     = "/aws/eks/amazing-hiphop-wardrobe/cluster"
  create_cloudwatch_log_group   = false

  # Optional: other config
  enable_irsa   = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_capacity = 2
      min_capacity     = 1
      max_capacity     = 3
    }
  }
}
