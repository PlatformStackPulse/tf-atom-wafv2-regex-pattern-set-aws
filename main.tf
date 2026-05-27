resource "aws_wafv2_regex_pattern_set" "default" {
  count = local.enabled ? 1 : 0

  name        = module.this.id
  description = var.description
  scope       = var.scope
  tags        = module.this.tags

  dynamic "regular_expression" {
    for_each = var.regular_expressions
    content {
      regex_string = regular_expression.value
    }
  }
}
