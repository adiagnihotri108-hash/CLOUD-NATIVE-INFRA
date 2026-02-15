resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = var.tags
}

resource "aws_security_group_rule" "ingress_cidr" {
  for_each = { for idx, rule in var.ingress_cidr_rules : idx => rule }

  type              = "ingress"
  security_group_id = aws_security_group.this.id

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = each.value.cidr_blocks

  description = try(each.value.description, null)
}

resource "aws_security_group_rule" "ingress_sg" {
  for_each = { for idx, rule in var.ingress_sg_rules : idx => rule }

  type              = "ingress"
  security_group_id = aws_security_group.this.id

  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.security_groups[0]

  description = try(each.value.description, null)
}

locals {
  ingress_cidr_rules = {
    for idx, rule in var.ingress_rules :
    idx => rule
    if length(try(rule.cidr_blocks, [])) > 0
  }
  ingress_sg_rules = {
    for idx, rule in var.ingress_rules :
    idx => rule
    if length(try(rule.security_groups, [])) > 0
  }
}

resource "aws_security_group_rule" "ingress_cidr_compat" {
  for_each = local.ingress_cidr_rules

  type              = "ingress"
  security_group_id = aws_security_group.this.id

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = each.value.cidr_blocks

  description = try(each.value.description, null)
}

resource "aws_security_group_rule" "ingress_sg_compat" {
  for_each = local.ingress_sg_rules

  type              = "ingress"
  security_group_id = aws_security_group.this.id

  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.security_groups[0]

  description = try(each.value.description, null)
}

resource "aws_security_group_rule" "egress" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  type              = "egress"
  security_group_id = aws_security_group.this.id

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = each.value.cidr_blocks

  description = try(each.value.description, null)
}
