##################################################################
#                   VPC MODULE                                   #
##################################################################

module "vpc" {
  source = "../../modules/vpc"

  my_vpc   = var.my_vpc
  vpc_cidr = var.vpc_cidr
  region   = var.region

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  ngtw               = var.ngtw
  single_nat_gateway = var.single_nat_gateway
  multi_ngtw         = var.multi_ngtw

  tags = {
    Project     = "aws-cloud-native-infra"
    Owner       = "Aditya_Agnihotri"
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}





# ---------------------------
# Security Groups 
# ---------------------------

module "alb_sg" {
  source = "../../modules/security-group"

  name   = "dev-alb-sg"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound"
    }
  ]

  tags = {
    Project     = "aws-cloud-native-infra"
    Environment = "dev"
  }
}

module "ec2_sg" {
  source = "../../modules/security-group"

  name       = "dev-ec2-sg"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.alb_sg]

  ingress_sg_rules = [
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      security_groups = [module.alb_sg.sg_id]
      description     = "Allow HTTP only from ALB"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound"
    }
  ]

  tags = {
    Project     = "aws-cloud-native-infra"
    Environment = "dev"
  }
}

# ---------------------------
# ALB
# ---------------------------

module "alb" {
  source = "../../modules/alb"

  alb_name          = var.alb_name
  target_group_name = var.target_group_name
  vpc_id            = module.vpc.vpc_id
  subnets           = module.vpc.public_subnets
  security_groups   = [module.alb_sg.sg_id]


  tags = {
    Project     = "aws-cloud-native-infra"
    Environment = "dev"
  }
}



