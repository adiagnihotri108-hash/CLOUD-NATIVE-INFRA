module "lambda_iam" {
  source = "../../modules/lambda-iam-role"

  lambda_role_name          = "${var.lambda_role_name}-dev"
  lambda_s3_bucket_arn      = module.app_s3.bucket_arn
  lambda_dynamodb_table_arn = module.app_dynamodb.table_arn

  tags = var.tags
}

module "lambda" {
  source = "../../modules/lambda"

  lambda_function_name = "${var.lambda_function_name}-s3-ddb-lambda"
  lambda_role_arn      = module.lambda_iam.role_arn



  enable_s3_trigger = true
  s3_bucket_name    = module.app_s3.bucket_name
  s3_bucket_arn     = module.app_s3.bucket_arn

  environment_variables = {
    TABLE_NAME = module.app_dynamodb.table_name
  }

  tags = var.tags
}


