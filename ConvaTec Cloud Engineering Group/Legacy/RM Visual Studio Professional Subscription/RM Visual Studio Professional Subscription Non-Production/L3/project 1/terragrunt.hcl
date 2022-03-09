locals {
  # Automatically load environment-level variables from files in parent folders
  azure_vars        = yamldecode(sops_decrypt_file(find_in_parent_folders("azure.yaml")))
  subscription_vars = yamldecode(sops_decrypt_file(find_in_parent_folders("subscription.yaml")))
  #subscription_vars = read_terragrunt_config(find_in_parent_folders("subscription.hcl"))

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
  source = "git@github.com:rui-matos-convatec/CEG-IaC-Modules-ACP.git//azurecaf/resources/azurecaf_namingconvention"

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
        ARM_SUBSCRIPTION_ID = local.subscription_vars.subscription_id
    }

  }
}


# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  businessunit  = "tech"
  convention    = "passthrough"
  environment   = "prod"
  name          = "teste"
  #postfix       = ""
  type          = "rg"
}
