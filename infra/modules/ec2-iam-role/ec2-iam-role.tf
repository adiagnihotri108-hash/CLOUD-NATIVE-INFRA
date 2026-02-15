data "aws_iam_policy_document" "trust_ec2" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.ec2_role_name
  assume_role_policy = data.aws_iam_policy_document.trust_ec2.json
  tags               = var.tags
}

data "aws_iam_policy_document" "custom" {
  statement {
    effect  = "Allow"
    actions = ["s3:*"]
    resources = [
      var.s3_bucket_arn,
      "${var.s3_bucket_arn}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["dynamodb:*"]
    resources = [var.dynamodb_table_arn]
  }
}

resource "aws_iam_policy" "custom" {
  name   = "${var.ec2_role_name}-policy"
  policy = data.aws_iam_policy_document.custom.json
}

resource "aws_iam_role_policy_attachment" "custom" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.custom.arn
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.ec2_role_name}-profile"
  role = aws_iam_role.this.name
}
