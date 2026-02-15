data "aws_iam_policy_document" "trust_lambda" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.lambda_role_name
  assume_role_policy = data.aws_iam_policy_document.trust_lambda.json
  tags               = var.tags
}

data "aws_iam_policy_document" "custom" {
  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${var.lambda_s3_bucket_arn}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:UpdateItem"
    ]
    resources = [var.lambda_dynamodb_table_arn]
  }
}

resource "aws_iam_policy" "custom" {
  name   = "${var.lambda_role_name}-policy"
  policy = data.aws_iam_policy_document.custom.json
}

resource "aws_iam_role_policy_attachment" "custom" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.custom.arn
}

resource "aws_iam_role_policy_attachment" "basic" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}