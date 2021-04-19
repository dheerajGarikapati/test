
    resource "aws_security_group" "worker_group_mgnt_one" {
  name_prefix = "worker_group_mgnt_one"
  vpc_id = module.vpc.vpc_id

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/8"]
  }
}

resource "aws_security_group" "worker_group_mgnt_two" {
  name_prefix = "worker_group_mgnt_two"
  vpc_id = module.vpc.vpc_id

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["192.168.0.0/16"]
  }
}

resource "aws_security_group" "worker_group_mgnt_three" {
  name_prefix = "worker_group_mgnt_three"
  vpc_id = module.vpc.vpc_id

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["172.16.0.0/16"]
  }
}