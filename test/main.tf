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
"Applying an expert understanding of development tools, processes, programming languages and environments to assignments and commiting to code build, integration and deployment automation in cloud environment.
•	Enabling AWS migration activities through design and development related tasks and architectural engagement.
•	Lead strategic work across the product suite and utilize application architecture to increase efficiency and effectiveness of complex issues
•	Provide support for problem and issue resolution, technical consultation and direction to business management and product team members.
•	Provide direction on product development practices, coding, data and testing standards with core reviews and sofware architecture.
•	Develop Data analytics applications using big data technologies Spark, Hadoop and Scala. By implementing spark job on financial data using functional programming languages like Scala and Clojure for faster data processing.
•	Conduct research and integrate industry best practices into processes and potential solutions.
"

    
    

