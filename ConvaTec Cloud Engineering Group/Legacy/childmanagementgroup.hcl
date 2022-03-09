locals {
    tenant       = yamldecode(sops_decrypt_file(find_in_parent_folders("tenant.yaml")))
}