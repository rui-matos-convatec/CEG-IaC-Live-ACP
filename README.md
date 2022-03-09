<img alt="ConvaTec" src="https://upload.wikimedia.org/wikipedia/en/4/4c/ConvaTec_logo.svg">  

# README

This is ConvaTec 's Terragrunt repository for IaC.
---
[![This is the link to Cloud][azure-badge]][azure] [![This is the CHANGELOG file][changelog-badge]][changelog] [![This is the NOTICE file][notice-badge]][notice] [![This is the LICENSE file][license-badge]][license] [![GITHUB](https://img.shields.io/badge/github-CEG--IaC--Modules--ACP-brightgreen.svg?style=flat&logo=github)](https://github.com/devCvT/CEG-IaC-Modules-AZURE/) [![TF Registry](https://img.shields.io/badge/terraform-docs-7B42BC.svg?style=flat&logo=terraform)](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)   [![TG Registry](https://img.shields.io/badge/terragrunt-docs-violet.svg?style=flat&logo=terraform)](https://terragrunt.gruntwork.io/docs/)

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
│   │   │   │   ├── Project 1
|   │   │   │   │   ├── AKS
|   │   │   │   │   ├── NSG
|   │   │   │   │   ├── SECOPS
|   │   │   │   │   ├── RESOURCEGROUP
│   │   │   |   │   └── terragrunt.hcl
│   │   │   |   └── project.hcl
│   │   │   ├── L4  
│   │   │   │   ├── Project 1
|   │   │   │       ├── LOGICAPP
|   │   │   │       ├── LOGICAPP2
│   │   │   |       └── terragrunt.hcl
│   │   │   ├── environment.hcl  
│   │   │   └── subscription.hcl  
│   │   └── RM Visual Studio Professional Subscription Non-Production  
│   │       ├── environment.hcl  
│   │       └── subscription.hcl  
│   └── childmanagementgroup.hcl  
├── global.hcl
├── rootmanagementgroup.hcl
├── tenant.hcl
└── terragrunt.hcl
```


Level 0: Transition from manual to automation  
Level 0 creates and onboards the desired subscriptions, creates the Terraform state repository for the different environments (sandpit, production, dev), creates the privileged access workstation, and service principals. Level 0 also enables the connection to the Azure DevOps environment as well as the creation of the DevOps private agents as well as the necessary Azure AD groups for collaboration between the developers of the environment.  

Level 1: Core security, Governance and Accounting  
Level 1 is responsible for Role Based Access Control (RBAC) enforcement of the subscriptions, subscription behavior configuration using Azure Management groups. Azure Policies ensures deployment of preventive and reactive controls. This level is also in charge of deploying the fundamental configuration for Azure Monitor and Log analytics, shared security services, including Azure Event Hub namespace for integration with third parties SIEM solutions.  

Level 2: Shared services  
Shared services include each environment's core networking components (using hub and spoke or any other network topology). Level 2 also includes services like Azure Site Recovery Vault for Backup and Disaster Recovery, Azure Monitor settings for the monitoring of the environment alongside with Azure Automation for patch management of the resources. Other resources could be image management for virtual machines in the environment.  

Level 3: Application infrastructure  
This layer is responsible for enforcing the application's environment overall configuration for instance the Azure AppService environment, the Azure Kubernetes Services Cluster, the API Management services and all its dependency to deliver a service: deploying the Azure Application Gateway, Web Application Firewall.  

Level 4: Application layer  
This level contains the application configuration and links to the source repository and frameworks. It describes which framework is used (for instance Springboot microservices, dotnet core, etc.) and describes the configuration of the application (how many instances, how to link to the database, etc.).  


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
Created and maintained by ConvaTec Cloud Engineering Group.  
©Convatec 2022  

## License
UNLICENSED - Copyright (C) ConvaTec - All Rights Reserved. See [license]  

[azure]: https://portal.azure.com
[azure-badge]: https://img.shields.io/badge/cloud-Microsoft%20Azure-blue.svg?style=flat&logo=microsoftazure
[readme]: ./README.md
[readme-badge]: https://img.shields.io/badge/readme-information-red.svg
[usage]: ./USAGE.md
[usage-badge]: https://img.shields.io/badge/usage-examples-lightgrey.svg
[changelog]: ./CHANGELOG.md
[changelog-badge]: https://img.shields.io/badge/changelog-release-green.svg
[license]: ./LICENSE.md
[license-badge]: https://img.shields.io/badge/license-%40ConvaTec-orange.svg
[notice]: ./NOTICE.md
[notice-badge]: https://img.shields.io/badge/notice-%40copyright-lightgrey.svg