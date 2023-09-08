variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Valid value is one of the following: dev, prod."
  }
}

variable "local-os" {
  type        = string
  description = "Local OS"
  validation {
    condition     = contains(["windows", "linux"], var.local-os)
    error_message = "Valid value is one of the following: windows, linux."
  }
}