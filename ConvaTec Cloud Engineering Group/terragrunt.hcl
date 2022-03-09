locals {    
    statefile       = yamldecode(sops_decrypt_file(find_in_parent_folders("state.yaml")))
    #azure_vars      = yamldecode(sops_decrypt_file(read_terragrunt_config("${get_terragrunt_dir()}/azure.yaml")))
    #azure_vars      = yamldecode(sops_decrypt_file("${get_parent_terragrunt_dir()}/azure.yaml"))
}

# Generate provider.tf
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  features {
  }
}
provider "azuread" {
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an Azure Storage Account
remote_state {
  backend = "azurerm"
  config = {
        subscription_id         = local.statefile.subscription_id
        key                     = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name     = local.statefile.resource_group_name
        storage_account_name    = local.statefile.storage_account_name
        container_name          = local.statefile.container_name
    }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
