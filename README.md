# Azure Resource Group
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/storage-account/azurerm/)

Common Azure terraform module to create a Storage Account.


<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.1 |
| azurerm | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.acr](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.network_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_tier | n/a | `string` | `"Hot"` | no |
| account\_kind | n/a | `string` | `"StorageV2"` | no |
| account\_tier | n/a | `any` | n/a | yes |
| client\_name | Name of client | `string` | n/a | yes |
| container\_access\_type | he Access Level configured for this Container. Possible values are blob, container or private | `string` | `"private"` | no |
| containers | Containers to create on the storage account | `list(string)` | `[]` | no |
| custom\_diagnostic\_settings\_name | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| custom\_domain\_name | n/a | `string` | `""` | no |
| default\_firewall\_action | Which default firewalling policy to apply. Valid values are Allow or Deny | `string` | `"Deny"` | no |
| enable\_https\_traffic\_only | n/a | `string` | `"true"` | no |
| environment | n/a | `any` | n/a | yes |
| extra\_tags | n/a | `map(string)` | `{}` | no |
| ip\_rules | IPs to allow access to that storage account | `list(string)` | `[]` | no |
| location | n/a | `any` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources Ids for logs diagnostics destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. Empty list to disable logging. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| logs\_retention\_days | Number of days to keep logs on storage account | `number` | `30` | no |
| min\_tls\_version | n/a | `string` | `"TLS1_2"` | no |
| name\_prefix | Optional prefix for storage account name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `""` | no |
| network\_bypass | Specifies whether traffic is bypassed for 'Logging', 'Metrics', 'AzureServices' or 'None' | `list(string)` | <pre>[<br>  "None"<br>]</pre> | no |
| replication\_type | n/a | `any` | n/a | yes |
| resource\_group\_name | n/a | `any` | n/a | yes |
| stack | n/a | `any` | n/a | yes |
| static\_website\_config | n/a | `list(map(string))` | `[]` | no |
| storage\_account\_custom\_name | Custom Azure Storage Account name, generated if not set | `string` | `""` | no |
| subnet\_ids | Subnets to allow access to that storage account | `list(string)` | `[]` | no |
| use\_caf\_naming | Use the Azure CAF naming provider to generate default resource name. `storage_account_custom_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
| use\_subdomain | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| name | n/a |
| primary\_blob\_endpoint | n/a |
| resource\_group\_name | n/a |
| secondary\_blob\_endpoint | n/a |
| storage\_account\_storage\_primary\_access\_key | n/a |
| storage\_account\_storage\_primary\_connection\_string | n/a |
| storage\_account\_storage\_secondary\_connection\_string | n/a |
<!-- END_TF_DOCS -->
