module "ec2_iam" {
  source = "../../modules/ec2-iam-role"

  ec2_role_name      = "${var.ec2_role_name}-dev"
  s3_bucket_arn      = module.app_s3.bucket_arn
  dynamodb_table_arn = module.app_dynamodb.table_arn


}



data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}



# ---------------------------
# EC2
# ---------------------------

module "ec2" {
  source = "../../modules/ec2"

  name               = "dev-app"
  subnet_ids         = module.vpc.private_subnets
  security_group_ids = [module.ec2_sg.sg_id]

  instance_type    = "t3.micro"
  ami_id           = data.aws_ami.amazon_linux.id
  target_group_arn = module.alb.target_group_arn

  iam_instance_profile = module.ec2_iam.instance_profile_name

  tags = {
    Project     = "aws-cloud-native-infra"
    Environment = "dev"
  }
}
