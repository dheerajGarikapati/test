provider "aws" {
  region = var.region
}
 
data "aws_eks_cluster" "cluster"{
    name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster"{
    name = module.eks.cluster_id
}

data "aws_availability_zones" "available"{}

locals {
  cluster_name = "Quinnox-eks"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name = local.cluster_name
  cluster_version = "1.18"
  cluster_create_timeout = "30m"
  cluster_endpoint_private_access = true
  subnets = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  workers_group_defaults = {
      root_volume_type = "gp2"
  }

worker_groups = [
    {
      name = "worker_group_1"  
      instance_type = "t2.small"
      asg_max_size  = 3
      additional_security_groud_ids =[aws_security_group.worker_group_mgnt_one.id]
    },

    {
      name = "worker_group_2"  
      instance_type = "t2.small"
      asg_max_size  = 3
      additional_security_groud_ids =[aws_security_group.worker_group_mgnt_two.id]
    },
     {
      name = "worker_group_3"  
      instance_type = "t2.medium"
      asg_max_size  = 3
      additional_security_groud_ids =[aws_security_group.worker_group_mgnt_three.id]
    }
  ]
}
    

