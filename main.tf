######################
# VPC Module
######################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = "my-eks-cluster-vpc"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway    = true
  single_nat_gateway    = true
  enable_dns_hostnames  = true
  enable_dns_support    = true
}


######################
# EKS Module
######################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.31"

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

######################
# Data source for AZs
######################
data "aws_availability_zones" "available" {}

