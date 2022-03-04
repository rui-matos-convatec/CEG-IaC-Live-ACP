<img alt="ConvaTec" src="https://upload.wikimedia.org/wikipedia/en/4/4c/ConvaTec_logo.svg">   
  
[![This is the link to Cloud][azure-badge]][azure]  ![Maintained by][ceg-badge]

# README

This is ConvaTec 's Terragrunt repository for IaC.
---
[![This is the CHANGELOG file][changelog-badge]][changelog] [![This is the USAGE file][usage-badge]][usage]  [![This is the LICENSE file][license-badge]][license]  

## Directory Structure
```
ConvaTec Cloud Engineering Group
├── Customer Facing
│   ├── Customer Facing Non-Production
│   │   ├── L1
│   │   ├── L2
│   │   ├── L3
│   │   │   ├──Resource group 1
│   │   │   │  └── terragrunt.hcl
│   │   │   └──Resource group 2
│   │   │      └── terragrunt.hcl
│   │   ├── environment.hcl
│   │   └── subscription.hcl
│   ├── Customer Facing Production
│   │   ├── L1
│   │   ├── L2
│   │   ├── L3
│   │   │   ├── Resource group 1
│   │   │   │   └── terragrunt.hcl
│   │   │   └── Resource group 2
│   │   │       └── terragrunt.hcl
│   │   ├── environment.hcl
│   │   └── subscription.hcl
│   └── childManagementGroup.hcl
├── Customer Support
│   ├── Customer Support Non-Production
│   │   ├── environment.hcl
│   │   └── subscription.hcl
│   ├── Customer Facing Production  
│   │   ├── environment.hcl  
│   │   └── subscription.hcl
│   └── childManagementGroup.hcl
├── Decomissioned  
│   └── childManagementGroup.hcl
├── Innovation  
│   ├── Customer Support Non-Production
│   │   ├── environment.hcl  
│   │   └── subscription.hcl  
│   ├── Customer Support Production
│   │   ├── environment.hcl  
│   │   └── subscription.hcl  
│   └── childManagementGroup.hcl
├── Operations  
│   ├── Customer Support Non-Production
│   │   ├── environment.hcl  
│   │   └── subscription.hcl  
│   ├── Customer Support Production
│   │   ├── environment.hcl  
│   │   └── subscription.hcl  
│   └── childManagementGroup.hcl
├── global.hcl 
├── managementgroup.hcl 
├── tenant.hcl  
└── terragrunt.hcl  
```

```
ConvaTec Cloud Engineering Group  
├── Legacy  
│   ├── AC Visual Studio Professional  
│   ├── RM Visual Studio Professional  
│   │   ├── RM Visual Studio Professional Subscription Non-Production  
│   │   │   ├── L1  
│   │   │   ├── L2
│   │   │   ├── L3  
│   │   │   │   ├── Resource Group 1  
│   │   │   │   └── terragrunt.hcl  
│   │   │   ├── environment.hcl  
│   │   │   └── subscription.hcl  
│   │   └── RM Visual Studio Professional Subscription Non-Production  
│   │       ├── environment.hcl  
│   │       └── subscription.hcl  
│   └── childManagementGroup.hcl  
├── global.hcl
├── rootmanagementgroup.hcl
├── tenant.hcl
└── terragrunt.hcl
```

These files make use of [pre-commit framework](http://pre-commit.com/)

## How to install

### 1. Install dependencies

<!-- markdownlint-disable no-inline-html -->
* [`terraform`](https://www.terraform.io/downloads)
* [`terragrunt`](https://terragrunt.gruntwork.io/docs/getting-started/install/)
* [`sops`](https://github.com/mozilla/sops/releases)
* [`pre-commit`](https://pre-commit.com/#install)
* [`checkov`](https://github.com/bridgecrewio/checkov) required for `checkov` hook.
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs) required for `terraform_docs` hook.
* [`terragrunt`](https://terragrunt.gruntwork.io/docs/getting-started/install/) required for `terragrunt_validate` hook.
* [`terrascan`](https://github.com/accurics/terrascan) required for `terrascan` hook.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.
* [`TFSec`](https://github.com/liamg/tfsec) required for `terraform_tfsec` hook.
* [`infracost`](https://github.com/infracost/infracost) required for `infracost_breakdown` hook.
* [`jq`](https://github.com/stedolan/jq) required for `infracost_breakdown` hook.

## Authors
Created and maintained by ConvaTec Cloud Engineering Group
©Convatec 2022

## License
UNLICENSED - Copyright (C) ConvaTec - All Rights Reserved. See [license]

[ceg-badge]: https://img.shields.io/badge/maintaned%20by-Cloud%20Engineering%20Group-yellow
[azure]: https://portal.azure.com
[azure-badge]: https://img.shields.io/badge/CLOUD-Microsoft%20Azure-green
[readme]: ./README.md
[readme-badge]: https://img.shields.io/badge/README-Check%20README%20file%20for%20module%20information-red
[usage]: ./USAGE.md
[usage-badge]: https://img.shields.io/badge/USAGE-Check%20USAGE%20file%20for%20inputs|output%20information-lightgrey
[changelog]: ./CHANGELOG.md
[changelog-badge]: https://img.shields.io/badge/CHANGELOG-Check%20CHANGELOG%20for%20changes-orange
[license]: ./LICENSE.md
[license-badge]: https://img.shields.io/badge/LICENSE-%40ConvaTec%20UNLICENSED%20and%20PRIVATE%20USAGE%20ONLY-blue
