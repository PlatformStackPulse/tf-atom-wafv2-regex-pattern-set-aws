output "regex_pattern_set_id" {
  description = "The ID of the WAFv2 Regex Pattern Set."
  value       = try(aws_wafv2_regex_pattern_set.this[0].id, "")
}

output "regex_pattern_set_arn" {
  description = "The ARN of the WAFv2 Regex Pattern Set."
  value       = try(aws_wafv2_regex_pattern_set.this[0].arn, "")
}

output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}
