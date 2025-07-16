module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.1" # or the version you're using

  cluster_name    = "amazing-hiphop-wardrobe"
  cluster_version = "1.29"
  vpc_id          = "vpc-0121b1a9ddb0ffbfe"

  subnet_ids = [
    "subnet-0c980a59bca3f2bc9",
    "subnet-038b4cd5e678d4ae9"
  ]

  eks_managed_node_group_defaults = {
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 2
      min_size     = 1
    }
  }
}
