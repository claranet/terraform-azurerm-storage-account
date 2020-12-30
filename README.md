# Azure Resource Group
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/rg/azurerm/)

Common Azure terraform module to create a Resource Group with optional lock.

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_rg\_name | Optional custom resource group name | `string` | `""` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Extra tags to add | `map(string)` | `{}` | no |
| location | Azure region to use | `string` | n/a | yes |
| lock\_level | Specifies the Level to be used for this RG Lock. Possible values are Empty (no lock), CanNotDelete and ReadOnly. | `string` | `""` | no |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| stack | Project stack name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_id | Resource group generated id |
| resource\_group\_location | Resource group location (region) |
| resource\_group\_name | Resource group name |

## Related documentation

Terraform Azure RG documentation: [terraform.io/docs/providers/azurerm/r/resource_group.html](https://www.terraform.io/docs/providers/azurerm/r/resource_group.html)

Terraform Lock management documentation: [terraform.io/docs/providers/azurerm/r/management_lock.html](https://www.terraform.io/docs/providers/azurerm/r/management_lock.html)
