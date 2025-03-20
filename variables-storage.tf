# Storage account parameters

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Changing this forces a new resource to be created. Defaults to `StorageV2`."
  type        = string
  default     = "StorageV2"
  nullable    = false
}

variable "account_tier" {
  description = "Defines the Tier to use for this Storage Account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
  nullable    = false
}

variable "access_tier" {
  description = "Defines the access tier for `BlobStorage`, `FileStorage` and `StorageV2` accounts. Valid options are `Hot` and `Cool`, defaults to `Hot`."
  type        = string
  default     = "Hot"
  nullable    = false
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this Storage Account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`."
  type        = string
  default     = "ZRS"
  nullable    = false
}

variable "https_traffic_only_enabled" {
  description = "Boolean flag which forces HTTPS if enabled."
  type        = bool
  default     = true
  nullable    = false
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the Storage Account. Possible values are `TLS1_0`, `TLS1_1`, and `TLS1_2`. "
  type        = string
  default     = "TLS1_2"
  nullable    = false
}

variable "custom_domain_name" {
  description = "The custom domain name to use for the Storage Account, which will be validated by Azure."
  type        = string
  default     = null
}

variable "use_subdomain" {
  description = "Whether the custom domain name should be validated by using indirect CNAME validation."
  type        = bool
  default     = false
  nullable    = false
}

variable "static_website_config" {
  description = "Static website configuration. Can only be set when the `account_kind` is set to `StorageV2` or `BlockBlobStorage`."
  type = object({
    index_document     = optional(string)
    error_404_document = optional(string)
  })
  default = null
}

variable "nfsv3_enabled" {
  description = "Is NFSv3 protocol enabled? Changing this forces a new resource to be created."
  type        = bool
  default     = false
  nullable    = false
}

variable "sftp_enabled" {
  description = "Is SFTP enabled?"
  type        = bool
  default     = false
  nullable    = false
}

variable "hns_enabled" {
  description = "Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 and must be `true` if `nfsv3_enabled` or `sftp_enabled` is set to `true`. Changing this forces a new resource to be created."
  type        = bool
  default     = false
  nullable    = false
}

# Identity

variable "identity_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both)."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Storage Account."
  type        = list(string)
  default     = null
}

# Data protection

variable "customer_managed_key" {
  description = "Customer Managed Key. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#customer_managed_key) for more information."
  type = object({
    key_vault_key_id          = optional(string, null)
    managed_hsm_key_id        = optional(string, null)
    user_assigned_identity_id = string
  })
  default = null
}

variable "infrastructure_encryption_enabled" {
  description = "Boolean flag which enables infrastructure encryption.  Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#infrastructure_encryption_enabled) for more information."
  type        = bool
  default     = false
  nullable    = false
}

variable "blob_data_protection" {
  description = "Storage account blob Data protection parameters."
  type = object({
    change_feed_enabled                       = optional(bool, false)
    change_feed_retention_in_days             = optional(number, null)
    versioning_enabled                        = optional(bool, false)
    last_access_time_enabled                  = optional(bool, false)
    delete_retention_policy_in_days           = optional(number, 0)
    container_delete_retention_policy_in_days = optional(number, 0)
    container_point_in_time_restore           = optional(bool, false)
  })
  default = {
    change_feed_enabled                       = true
    change_feed_retention_in_days             = null
    last_access_time_enabled                  = true
    versioning_enabled                        = true
    delete_retention_policy_in_days           = 30
    container_delete_retention_policy_in_days = 30
    container_point_in_time_restore           = true
  }
}

variable "blob_cors_rules" {
  description = "Storage Account blob CORS rules. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) for more information."
  type = list(object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  }))
  default  = []
  nullable = false
}

# Threat protection

variable "advanced_threat_protection_enabled" {
  description = "Boolean flag which controls if advanced threat protection is enabled, see [documentation](https://docs.microsoft.com/en-us/azure/storage/common/storage-advanced-threat-protection?tabs=azure-portal) for more information."
  type        = bool
  default     = false
  nullable    = false
}

# Data creation/bootstrap

variable "containers" {
  description = "List of objects to create some Blob containers in this Storage Account."
  type = list(object({
    name                  = string
    container_access_type = optional(string, "private")
    metadata              = optional(map(string))
  }))
  default  = []
  nullable = false
}

variable "file_shares" {
  description = "List of objects to create some File Shares in this Storage Account."
  type = list(object({
    name             = string
    quota_in_gb      = number
    enabled_protocol = optional(string)
    metadata         = optional(map(string))
    acl = optional(list(object({
      id          = string
      permissions = string
      start       = optional(string)
      expiry      = optional(string)
    })))
  }))
  default  = []
  nullable = false
}

variable "tables" {
  description = "List of objects to create some Tables in this Storage Account."
  type = list(object({
    name = string
    acl = optional(list(object({
      id          = string
      permissions = string
      start       = optional(string)
      expiry      = optional(string)
    })))
  }))
  default  = []
  nullable = false
}

variable "queues" {
  description = "List of objects to create some Queues in this Storage Account."
  type = list(object({
    name     = string
    metadata = optional(map(string))
  }))
  default  = []
  nullable = false
}

variable "queue_properties_logging" {
  description = "Logging queue properties"
  type = object({
    delete                = optional(bool, true)
    read                  = optional(bool, true)
    write                 = optional(bool, true)
    version               = optional(string, "1.0")
    retention_policy_days = optional(number, 10)
  })
  default = {}
}

variable "cross_tenant_replication_enabled" {
  description = "Enable cross tenant replication."
  type        = bool
  default     = false
  nullable    = false
}

variable "allowed_copy_scope" {
  description = "Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are `AAD` and `PrivateLink`."
  type        = string
  default     = null
  validation {
    condition     = contains(["AAD", "PrivateLink"], var.allowed_copy_scope) || var.allowed_copy_scope == null
    error_message = "allowed values for allowed_copy_scope are 'AAD' or 'PrivateLink'."
  }
}
