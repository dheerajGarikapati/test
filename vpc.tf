module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    name = "Quinnox-vpx"
    cidr = "10.0.0.0/16"
    azs = data.aws_availability_zones.available.names
    enable_nat_gateway = true
    single_nat_gateway = true
    private_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
    public_subnets = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]

    public_subnet_tags = {
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }

    private_subnet_tags = {
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/internal-elb" = "1"
    }
}