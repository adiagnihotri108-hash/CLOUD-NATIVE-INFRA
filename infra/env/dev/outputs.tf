
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "alb_sg_id" {
  value = module.alb_sg.sg_id
}

output "ec2_sg_id" {
  value = module.ec2_sg.sg_id
}

output "ec2_instance_profile" {
  value = module.ec2_iam.instance_profile_name
}


output "alb_url" {
  value = "http://${module.alb.alb_dns_name}"
}

output "s3_bucket_name_arn" {
  value = module.app_s3.bucket_arn
}

output "dynamodb_table_arn" {
  value = module.app_dynamodb.table_arn
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}
#done

