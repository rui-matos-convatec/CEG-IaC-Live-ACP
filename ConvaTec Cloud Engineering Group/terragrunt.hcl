
# terragrunt-cloudtruth-deploy/development/terragrunt.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  subscription_id = local.azure_vars["azure.azsubscription_id"]
  tenant_id       = local.azure_vars["azure.aztenant_id"]
  client_id       = local.azure_vars["azure.azclient_id"]
  client_secret   = local.azure_vars["azure.azclient_secret"]
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}
provider "azuread" {
} 
EOF
}
