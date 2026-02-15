data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_code"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "this" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}

# Allow S3 to invoke Lambda
resource "aws_lambda_permission" "allow_s3" {
  count = var.enable_s3_trigger ? 1 : 0

  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}

# Configure S3 → Lambda trigger
resource "aws_s3_bucket_notification" "this" {
  count  = var.enable_s3_trigger ? 1 : 0
  bucket = var.s3_bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.this.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
