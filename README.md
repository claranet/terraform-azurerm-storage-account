# Azure Storage Account
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/storage-account/azurerm/)

Common Azure terraform module to create a Storage Account and manage related parameters (Threat protection, Network Rules, Blob Containers, File Shares, etc.)

## Azure File share authentication

If you need to enable Active Directory or AAD DS authentication for Azure File on this Storage Account, please read the [Microsoft documentation](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-identity-ad-ds-enable) and set the required values in the `file_share_authentication` variable.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "storage_account" {
  source  = "claranet/storage-account/azurerm"
  version = "x.x.x"

  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  environment    = var.environment
  stack          = var.stack

  resource_group_name = module.rg.name

  allowed_cidrs = [format("%s/32", data.http.my_ip.body)]

  account_replication_type = "ZRS"

  blob_data_protection = {
    change_feed_enabled                       = true
    versioning_enabled                        = true
    delete_retention_policy_in_days           = 42
    container_delete_retention_policy_in_days = 42
    container_point_in_time_restore           = true
  }

  # Disabled by default
  blob_cors_rules = [{
    allowed_headers    = ["*"]
    allowed_methods    = ["GET", "HEAD"]
    allowed_origins    = ["https://example.com"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }]

  logs_destinations_ids = [
    # module.run.logs_storage_account_id,
    # module.run.log_analytics_workspace_id,
  ]

  # Set by default
  queue_properties_logging = {
    delete                = true
    read                  = true
    write                 = true
    version               = "1.0"
    retention_policy_days = 10
  }

  containers = [
    {
      name = "container1"
    },
    {
      name = "container2"
      # container_access_type = "blob"
    }
  ]

  file_shares = [
    {
      name        = "share1smb"
      quota_in_gb = 50
    }
  ]

  tables = [
    {
      name = "table1"
    }
  ]

  queues = [
    {
      name = "queue1"
    }
  ]

  extra_tags = {
    foo = "bar"
  }
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.9 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.0.0 |
| diagnostics\_type | claranet/diagnostic-settings/azurerm | ~> 8.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_advanced_threat_protection.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/advanced_threat_protection) | resource |
| [azurerm_role_assignment.sta_blob_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_blob_owner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_blob_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_file_priv_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_file_priv_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_file_smb_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_file_smb_owner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_file_smb_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_queue_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_queue_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_table_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_table_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_container.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_queue.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_share.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |
| [azurerm_storage_table.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_table) | resource |
| [azurecaf_name.sa](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_tier | Defines the access tier for `BlobStorage`, `FileStorage` and `StorageV2` accounts. Valid options are `Hot` and `Cool`, defaults to `Hot`. | `string` | `"Hot"` | no |
| account\_kind | Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Changing this forces a new resource to be created. Defaults to `StorageV2`. | `string` | `"StorageV2"` | no |
| account\_replication\_type | Defines the type of replication to use for this Storage Account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`. | `string` | `"ZRS"` | no |
| account\_tier | Defines the Tier to use for this Storage Account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| advanced\_threat\_protection\_enabled | Boolean flag which controls if advanced threat protection is enabled, see [documentation](https://docs.microsoft.com/en-us/azure/storage/common/storage-advanced-threat-protection?tabs=azure-portal) for more information. | `bool` | `false` | no |
| allowed\_cidrs | List of CIDR to allow access to that Storage Account. | `list(string)` | `[]` | no |
| blob\_cors\_rules | Storage Account blob CORS rules. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) for more information. | <pre>list(object({<br/>    allowed_headers    = list(string)<br/>    allowed_methods    = list(string)<br/>    allowed_origins    = list(string)<br/>    exposed_headers    = list(string)<br/>    max_age_in_seconds = number<br/>  }))</pre> | `[]` | no |
| blob\_data\_protection | Storage account blob Data protection parameters. | <pre>object({<br/>    change_feed_enabled                       = optional(bool, false)<br/>    versioning_enabled                        = optional(bool, false)<br/>    last_access_time_enabled                  = optional(bool, false)<br/>    delete_retention_policy_in_days           = optional(number, 0)<br/>    container_delete_retention_policy_in_days = optional(number, 0)<br/>    container_point_in_time_restore           = optional(bool, false)<br/>  })</pre> | <pre>{<br/>  "change_feed_enabled": true,<br/>  "container_delete_retention_policy_in_days": 30,<br/>  "container_point_in_time_restore": true,<br/>  "delete_retention_policy_in_days": 30,<br/>  "last_access_time_enabled": true,<br/>  "versioning_enabled": true<br/>}</pre> | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| containers | List of objects to create some Blob containers in this Storage Account. | <pre>list(object({<br/>    name                  = string<br/>    container_access_type = optional(string, "private")<br/>    metadata              = optional(map(string))<br/>  }))</pre> | `[]` | no |
| cross\_tenant\_replication\_enabled | Enable cross tenant replication. | `bool` | `false` | no |
| custom\_domain\_name | The custom domain name to use for the Storage Account, which will be validated by Azure. | `string` | `null` | no |
| custom\_name | Custom Azure Storage Account name, generated if not set. | `string` | `""` | no |
| customer\_managed\_key | Customer Managed Key. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#customer_managed_key) for more information. | <pre>object({<br/>    key_vault_key_id          = optional(string, null)<br/>    managed_hsm_key_id        = optional(string, null)<br/>    user_assigned_identity_id = string<br/>  })</pre> | `null` | no |
| default\_firewall\_action | Which default firewalling policy to apply. Valid values are `Allow` or `Deny`. | `string` | `"Deny"` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be `default` if not set. | `string` | `"default"` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with your Azure Storage Account. | `map(string)` | `{}` | no |
| file\_share\_authentication | Storage Account file shares authentication configuration. | <pre>object({<br/>    directory_type = string<br/>    active_directory = optional(object({<br/>      storage_sid         = string<br/>      domain_name         = string<br/>      domain_sid          = string<br/>      domain_guid         = string<br/>      forest_name         = string<br/>      netbios_domain_name = string<br/>    }))<br/>  })</pre> | `null` | no |
| file\_share\_cors\_rules | Storage Account file shares CORS rule. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) for more information. | <pre>object({<br/>    allowed_headers    = list(string)<br/>    allowed_methods    = list(string)<br/>    allowed_origins    = list(string)<br/>    exposed_headers    = list(string)<br/>    max_age_in_seconds = number<br/>  })</pre> | `null` | no |
| file\_share\_properties\_smb | Storage Account file shares smb properties. | <pre>object({<br/>    versions                        = optional(list(string), null)<br/>    authentication_types            = optional(list(string), null)<br/>    kerberos_ticket_encryption_type = optional(list(string), null)<br/>    channel_encryption_type         = optional(list(string), null)<br/>    multichannel_enabled            = optional(bool, null)<br/>  })</pre> | `null` | no |
| file\_share\_retention\_policy\_in\_days | Storage Account file shares retention policy in days. Enabling this may require additional directory permissions. | `number` | `null` | no |
| file\_shares | List of objects to create some File Shares in this Storage Account. | <pre>list(object({<br/>    name             = string<br/>    quota_in_gb      = number<br/>    enabled_protocol = optional(string)<br/>    metadata         = optional(map(string))<br/>    acl = optional(list(object({<br/>      id          = string<br/>      permissions = string<br/>      start       = optional(string)<br/>      expiry      = optional(string)<br/>    })))<br/>  }))</pre> | `[]` | no |
| hns\_enabled | Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 and must be `true` if `nfsv3_enabled` or `sftp_enabled` is set to `true`. Changing this forces a new resource to be created. | `bool` | `false` | no |
| https\_traffic\_only\_enabled | Boolean flag which forces HTTPS if enabled. | `bool` | `true` | no |
| identity\_ids | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Storage Account. | `list(string)` | `null` | no |
| identity\_type | Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both). | `string` | `"SystemAssigned"` | no |
| infrastructure\_encryption\_enabled | Boolean flag which enables infrastructure encryption.  Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#infrastructure_encryption_enabled) for more information. | `bool` | `false` | no |
| location | Azure location. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| min\_tls\_version | The minimum supported TLS version for the Storage Account. Possible values are `TLS1_0`, `TLS1_1`, and `TLS1_2`. | `string` | `"TLS1_2"` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| network\_bypass | Specifies whether traffic is bypassed for 'Logging', 'Metrics', 'AzureServices' or 'None'. | `list(string)` | <pre>[<br/>  "Logging",<br/>  "Metrics",<br/>  "AzureServices"<br/>]</pre> | no |
| network\_rules\_enabled | Boolean to enable Network Rules on the Storage Account, requires `network_bypass`, `allowed_cidrs`, `subnet_ids` or `default_firewall_action` correctly set if enabled. | `bool` | `true` | no |
| nfsv3\_enabled | Is NFSv3 protocol enabled? Changing this forces a new resource to be created. | `bool` | `false` | no |
| private\_link\_access | List of Privatelink objects to allow access from. | <pre>list(object({<br/>    endpoint_resource_id = string<br/>    endpoint_tenant_id   = optional(string, null)<br/>  }))</pre> | `[]` | no |
| public\_nested\_items\_allowed | Allow or disallow nested items within this Account to opt into being public. | `bool` | `false` | no |
| public\_network\_access\_enabled | Whether the public network access is enabled. | `bool` | `true` | no |
| queue\_properties\_logging | Logging queue properties | <pre>object({<br/>    delete                = optional(bool, true)<br/>    read                  = optional(bool, true)<br/>    write                 = optional(bool, true)<br/>    version               = optional(string, "1.0")<br/>    retention_policy_days = optional(number, 10)<br/>  })</pre> | `{}` | no |
| queues | List of objects to create some Queues in this Storage Account. | <pre>list(object({<br/>    name     = string<br/>    metadata = optional(map(string))<br/>  }))</pre> | `[]` | no |
| rbac\_storage\_blob\_role\_principal\_ids | The principal IDs of the users, groups, and service principals to assign the `Storage Blob Data *` different roles to if Blob containers are created. | <pre>object({<br/>    owners       = optional(list(string), [])<br/>    contributors = optional(list(string), [])<br/>    readers      = optional(list(string), [])<br/>  })</pre> | `{}` | no |
| rbac\_storage\_contributor\_role\_principal\_ids | The principal IDs of the users, groups, and service principals to assign the `Storage Account Contributor` role to. | `list(string)` | `[]` | no |
| rbac\_storage\_file\_role\_principal\_ids | The principal IDs of the users, groups, and service principals to assign the `Storage File Data *` different roles to if File Shares are created. | <pre>object({<br/>    privileged_contributors = optional(list(string), [])<br/>    privileged_readers      = optional(list(string), [])<br/>    smb_owners              = optional(list(string), [])<br/>    smb_contributors        = optional(list(string), [])<br/>    smb_readers             = optional(list(string), [])<br/>  })</pre> | `{}` | no |
| rbac\_storage\_queue\_contributor\_role\_principal\_ids | The principal IDs of the users, groups, and service principals to assign the `Storage Queue Data *` role to. | <pre>object({<br/>    contributors = optional(list(string), [])<br/>    readers      = optional(list(string), [])<br/>  })</pre> | `{}` | no |
| rbac\_storage\_table\_role\_principal\_ids | The principal IDs of the users, groups, and service principals to assign the `Storage Table Data *` role to. | <pre>object({<br/>    contributors = optional(list(string), [])<br/>    readers      = optional(list(string), [])<br/>  })</pre> | `{}` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| sftp\_enabled | Is SFTP enabled? | `bool` | `false` | no |
| shared\_access\_key\_enabled | Indicates whether the Storage Account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Entra ID). | `bool` | `false` | no |
| stack | Project stack name. | `string` | n/a | yes |
| static\_website\_config | Static website configuration. Can only be set when the `account_kind` is set to `StorageV2` or `BlockBlobStorage`. | <pre>object({<br/>    index_document     = optional(string)<br/>    error_404_document = optional(string)<br/>  })</pre> | `null` | no |
| subnet\_ids | Subnets to allow access to that Storage Account. | `list(string)` | `[]` | no |
| tables | List of objects to create some Tables in this Storage Account. | <pre>list(object({<br/>    name = string<br/>    acl = optional(list(object({<br/>      id          = string<br/>      permissions = string<br/>      start       = optional(string)<br/>      expiry      = optional(string)<br/>    })))<br/>  }))</pre> | `[]` | no |
| use\_subdomain | Whether the custom domain name should be validated by using indirect CNAME validation. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Storage Account ID. |
| identity\_principal\_id | Storage Account system identity principal ID. |
| module\_diagnostics | Diagnostics settings module outputs. |
| name | Storage Account name. |
| resource | Storage Account resource object. |
| resource\_blob\_containers | Created blob containers in the Storage Account. |
| resource\_file\_shares | Created file shares in the Storage Account. |
| resource\_queues | Created queues in the Storage Account. |
| resource\_tables | Created tables in the Storage Account. |
<!-- END_TF_DOCS -->
