module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"


  name = var.my_vpc
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway     = var.ngtw
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.multi_ngtw

  tags = var.tags
}