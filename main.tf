resource "aws_wafv2_regex_pattern_set" "this" {
  count = local.enabled ? 1 : 0

  name        = module.this.id
  description = var.description
  scope       = var.scope

  dynamic "regular_expression" {
    for_each = var.regular_expressions
    content {
      regex_string = regular_expression.value
    }
  }

  tags = module.this.tags
}
