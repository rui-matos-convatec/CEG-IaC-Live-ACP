# Automatically load subscription level variables.
# This is automatically pulled in the root terragrunt.hcl configuration
locals {
  childmanagementgroup_vars = read_terragrunt_config(find_in_parent_folders("childmanagementgroup.hcl"))
}
