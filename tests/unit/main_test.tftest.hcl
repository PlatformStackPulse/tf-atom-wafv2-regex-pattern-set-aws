# Unit Tests — tf-atom-wafv2-regex-pattern-set-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# All assertions are on plan-KNOWN values (tf-label id, resource count,
# input pass-throughs), NEVER on computed arn/id (unknown under a mock).
#
# Run:         terraform test -test-directory=tests/unit
# Run verbose: terraform test -test-directory=tests/unit -verbose

mock_provider "aws" {}

variables {
  # tf-label context
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # Module-specific required / sample inputs
  scope               = "REGIONAL"
  description         = "Managed regex pattern set for unit test"
  regular_expressions = ["^/admin", "\\.php$"]
}

# ---------------------------------------------------------------------------
# Test: module creates the regex pattern set when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should be enabled by default."
  }

  assert {
    condition     = length(aws_wafv2_regex_pattern_set.default) == 1
    error_message = "Exactly one regex pattern set should be planned when enabled."
  }

  assert {
    condition     = aws_wafv2_regex_pattern_set.default[0].name == "eg-test-thing"
    error_message = "Regex pattern set name should use the tf-label id 'eg-test-thing'."
  }

  assert {
    condition     = aws_wafv2_regex_pattern_set.default[0].scope == "REGIONAL"
    error_message = "Scope should pass through as REGIONAL."
  }
}

# ---------------------------------------------------------------------------
# Test: module creates nothing when disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "Module should be disabled when enabled = false."
  }

  assert {
    condition     = length(aws_wafv2_regex_pattern_set.default) == 0
    error_message = "No regex pattern set should be planned when disabled."
  }

  assert {
    condition     = output.id == ""
    error_message = "id output should be empty string when the module is disabled."
  }
}
