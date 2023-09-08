variable "environment" {
  type        = string
  description = "Deployment environment: [dev, prod]"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Valid value is one of the following: dev, prod."
  }
}

variable "local-os" {
  type        = string
  description = "Local OS: [windows, linux]"
  validation {
    condition     = contains(["windows", "linux"], var.local-os)
    error_message = "Valid value is one of the following: windows, linux."
  }
}