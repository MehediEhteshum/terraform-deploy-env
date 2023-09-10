variable "cloud-provider" {
  type        = string
  description = "Type the cloud service provider for the deployment: [azure, aws]"
  validation {
    condition     = contains(["azure", "aws"], var.cloud-provider)
    error_message = "Valid value is one of the following: azure, aws."
  }
}

variable "environment" {
  type        = string
  description = "Type the deployment environment: [dev, prod]"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Valid value is one of the following: dev, prod."
  }
}

variable "local-os" {
  type        = string
  description = "Type your local OS: [windows, linux]"
  validation {
    condition     = contains(["windows", "linux"], var.local-os)
    error_message = "Valid value is one of the following: windows, linux."
  }
}

# override default from CLI: -var="location-azure=West US"
variable "location-azure" {
  type        = string
  description = "Type the location for the deployment: e.g. East US"
  default     = "East US"
}

# override default from CLI: -var="location-aws=us-west-1"
variable "location-aws" {
  type        = string
  description = "Type the location for the deployment: e.g. us-east-1"
  default     = "us-east-1"
}
