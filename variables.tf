# -----------------------------------------------------------------------------
# Module-Specific Variables
# -----------------------------------------------------------------------------

variable "scope" {
  type        = string
  description = "Scope of the regex pattern set. Valid values: REGIONAL, CLOUDFRONT."
  validation {
    condition     = contains(["REGIONAL", "CLOUDFRONT"], var.scope)
    error_message = "Scope must be REGIONAL or CLOUDFRONT."
  }
}

variable "description" {
  type        = string
  description = "Description of the regex pattern set."
  default     = ""
}

variable "regular_expressions" {
  type        = list(string)
  description = "List of regex patterns."
  default     = []
}
