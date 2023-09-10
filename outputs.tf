output "env-pubip" {
  value = var.cloud-provider == "azure" ? module.azure-env[0].public-ip-address : module.aws-env[0].public-ip-address
}
