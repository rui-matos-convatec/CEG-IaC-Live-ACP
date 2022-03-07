locals {
    #azure_vars        = yamldecode(sops_decrypt_file(find_in_parent_folders("azure.yaml")))
    #azure_vars      = yamldecode(sops_decrypt_file(read_terragrunt_config("${get_terragrunt_dir()}/azure.yaml")))
    #azure_vars      = yamldecode(sops_decrypt_file("${get_parent_terragrunt_dir()}/azure.yaml"))
}
# Generate provder.tf
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
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
