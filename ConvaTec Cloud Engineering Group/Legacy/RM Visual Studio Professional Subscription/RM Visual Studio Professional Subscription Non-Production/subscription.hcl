# Automatically load subscription level variables.
# This is automatically pulled in the root terragrunt.hcl configuration
locals {
  childmanagementgroup_vars           = read_terragrunt_config(find_in_parent_folders("childmanagementgroup.hcl"))
  subscription_id   = "5f1d1089-925a-4ed4-8444-dc42de1acbac"
}
