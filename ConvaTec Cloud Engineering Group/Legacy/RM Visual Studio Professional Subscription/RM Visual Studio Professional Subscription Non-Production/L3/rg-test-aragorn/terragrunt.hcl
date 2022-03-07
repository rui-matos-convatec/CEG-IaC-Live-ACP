locals {
  # Automatically load environment-level variables from files in parent folders
  azure_vars        = yamldecode(sops_decrypt_file(find_in_parent_folders("azure.yaml")))
  #global_vars       = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  #L1_vars           = read_terragrunt_config(find_in_parent_folders("rootmanagementgroup.hcl"))
  #tenant_vars       = read_terragrunt_config(find_in_parent_folders("tenant.hcl"))
  #L2_vars           = read_terragrunt_config(find_in_parent_folders("childmanagementgroup.hcl"))
  environment_vars  = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  subscription_vars = read_terragrunt_config(find_in_parent_folders("subscription.hcl"))

  #resource_vars     = read_terragrunt_config("${get_terragrunt_dir()}/resource.hcl")

  #Variables
  #location      = "West Europe"
  #name          = "stdiagconvatec"
  #businessunit  = try(local.subscription_vars.locals.businessUnit,"")
  #environment   = try(local.subscription_vars.locals.environment,"")
  #postfix       = try(local.subscription_vars.locals.postfix, "")
  #convention    = try(local.subscription_vars.locals.convention, "cafcvt")
}

# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:rui-matos-convatec/CEG-IaC-Modules-ACP.git//azurerm/resources/azurerm_resource_group?ref=v0.0.1"

  extra_arguments "force_subscription" {
      commands = [
        "init",
        "apply",
        "destroy",
        "refresh",
        "import",
        "plan",
        "taint",
        "untaint"
      ]

    env_vars = {
        ARM_TENANT_ID       = local.azure_vars.azure.aztenant_id #dependency.credentials.outputs.tenant_id
        ARM_CLIENT_ID       = local.azure_vars.azure.azclient_id #dependency.credentials.outputs.client_id
        ARM_CLIENT_SECRET   = local.azure_vars.azure.azclient_secret #dependency.credentials.outputs.client_secret
        ARM_SUBSCRIPTION_ID = local.subscription_vars.locals.subscription_id
    }

  }
}


# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  location  = "West Europe"
  name      = "rg-test-aragorn"
  #name      = local.subscription_vars.locals.subscription_id
}
