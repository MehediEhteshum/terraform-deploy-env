output "env-pubip" {
  value = var.cloud-provider == "azure" ? module.azure-env[0].public-ip-address : var.cloud-provider == "aws" ? module.aws-env[0].public-ip-address : module.gcp-env[0].public-ip-address
}
