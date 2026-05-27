output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "id" {
  description = "The ID of the regex pattern set."
  value       = try(aws_wafv2_regex_pattern_set.default[0].id, "")
}

output "arn" {
  description = "The ARN of the regex pattern set."
  value       = try(aws_wafv2_regex_pattern_set.default[0].arn, "")
}
