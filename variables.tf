variable "scope" {
  type        = string
  description = "Scope of the Regex Pattern Set. Valid values: REGIONAL, CLOUDFRONT."
  validation {
    condition     = contains(["REGIONAL", "CLOUDFRONT"], var.scope)
    error_message = "Scope must be REGIONAL or CLOUDFRONT."
  }
}

variable "regular_expressions" {
  type        = list(string)
  description = "List of regular expression strings for the pattern set."
  validation {
    condition     = length(var.regular_expressions) > 0
    error_message = "At least one regular expression must be provided."
  }
}

variable "description" {
  type        = string
  description = "Description of the regex pattern set."
  default     = ""
}
