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

module "storage-account" {
  source = "claranet/storage-account/azurerm"
  version = "x.x.x"
  
  location             = module.azure-region.location
  location_short       = module.azure-region.location_short
  client_name          = var.client_name
  stack                = var.stack
  environment          = var.environment

  storage_account_name = "mystorageaccount"
  resource_group_name  = module.rg.resource_group_name

  access_tier               = "Hot"
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  replication_type          = "GRS"
  enable_https_traffic_only = "true"

  min_tls_version = "TLS1_2"

  static_website_config = [
      {
        index_document     = "index.html"
        error_404_document = "error.html"
      },
    ]
  containers            = ["container1", "container2"]

  extra_tags = var.extra_tags

  default_firewall_action = "Allow"
  network_bypass          = ["AzureServices"]
  ip_rules                = ["100.0.0.1", "100.0.0.2"]
  subnet_ids              = [azurerm_subnet.example.id]
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| resource\_group\_name | Optional custom resource group name | `string` | `""` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Extra tags to add | `map(string)` | `{}` | no |
| location | Azure region to use | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| location\_short | Short string for Azure location | `string` | n/a | yes |
| storage\_account\_name | Optional custom storage account name | `string` | n/a | no |
| access\_tier | Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts | `string` | n/a | yes |
| account\_tier | Defines the Tier to use | `string` | n/a | yes |
| account\_kind | Defines the Kind of account | `string` | n/a | yes |
| replication\_type | Defines the type of replication to use | `string` | n/a | yes |
| enable\_https\_traffic\_only | Boolean flag which forces HTTPS if enabled | `boolean` | n/a | yes |
| min\_tls\_version | The minimum supported TLS version | `string` | n/a | no |
| static\_website\_config | an only be set when the account_kind is set to StorageV2 or BlockBlobStorage | `list(map(string))` | n/a | no |
| index\_document | The webpage that Azure Storage serves for requests to the root of a website or any subfolder | `string` | n/a | no |
| error\_404\_document | The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file | `string` | n/a | no |
| containers | List of containers to create | `string` | n/a | no |
| default\\ | Specifies the default action of allow or deny when no other rules match | `string` | n/a | yes |
| network\_bypass | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices | `list(string)` | n/a | no |
| ip\_rules | List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed | `list(string)` | n/a | no |
| subnet\_ids |  list of resource ids for subnets | `list(string)` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_account\_storage\_primary\_connection\_string | Primary connection string |
| storage\_account_storage\_secondary\_connection\_string | Secondary connection string |
| name | Storage account name |
| primary\_blob\_endpoint | The hostname with port if applicable for blob storage in the primary location |
| secondary\_blob\_endpoint | The endpoint URL for blob storage in the secondary location. |
| resource\_group\_name | Resource group name |
| id | Storage account id |
| storage\_account\_containers | Containers names |


## Related documentation

Terraform Azure RG documentation: [terraform.io/docs/providers/azurerm/r/resource_group.html](https://www.terraform.io/docs/providers/azurerm/r/resource_group.html)


<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0 >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.network_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_container.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_tier | n/a | `string` | `"Hot"` | no |
| account\_kind | n/a | `string` | `"StorageV2"` | no |
| account\_tier | n/a | `any` | n/a | yes |
| client\_name | Name of client | `string` | n/a | yes |
| container\_access\_type | he Access Level configured for this Container. Possible values are blob, container or private | `string` | `"private"` | no |
| containers | Containers to create on the storage account | `list(string)` | `[]` | no |
| custom\_domain\_name | n/a | `string` | `""` | no |
| default\_firewall\_action | Which default firewalling policy to apply. Valid values are Allow or Deny | `string` | `"Deny"` | no |
| enable\_https\_traffic\_only | n/a | `string` | `"true"` | no |
| environment | n/a | `any` | n/a | yes |
| extra\_tags | n/a | `map(string)` | `{}` | no |
| ip\_rules | IPs to allow access to that storage account | `list(string)` | `[]` | no |
| location | n/a | `any` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| min\_tls\_version | n/a | `string` | `"TLS1_2"` | no |
| name\_prefix | Optional prefix for storage account name | `string` | `""` | no |
| network\_bypass | Specifies whether traffic is bypassed for 'Logging', 'Metrics', 'AzureServices' or 'None' | `list(string)` | <pre>[<br>  "None"<br>]</pre> | no |
| replication\_type | n/a | `any` | n/a | yes |
| resource\_group\_name | n/a | `any` | n/a | yes |
| stack | n/a | `any` | n/a | yes |
| static\_website\_config | n/a | `list(map(string))` | `[]` | no |
| storage\_account\_name | n/a | `any` | n/a | yes |
| subnet\_ids | Subnets to allow access to that storage account | `list(string)` | `[]` | no |
| use\_subdomain | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| name | n/a |
| primary\_blob\_endpoint | n/a |
| resource\_group\_name | n/a |
| secondary\_blob\_endpoint | n/a |
| storage\_account\_containers | n/a |
| storage\_account\_storage\_primary\_access\_key | n/a |
| storage\_account\_storage\_primary\_connection\_string | n/a |
| storage\_account\_storage\_secondary\_connection\_string | n/a |
<!-- END_TF_DOCS -->