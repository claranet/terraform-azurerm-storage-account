variable "file_share_cors_rules" {
  description = "Storage Account file shares CORS rule. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) for more information."
  type = object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  })
  default = null
}

variable "file_share_retention_policy_in_days" {
  description = "Storage Account file shares retention policy in days. Enabling this may require additional directory permissions."
  type        = number
  default     = null
}

variable "file_share_properties_smb" {
  description = "Storage Account file shares smb properties."
  type = object({
    versions                        = optional(list(string), null)
    authentication_types            = optional(list(string), null)
    kerberos_ticket_encryption_type = optional(list(string), null)
    channel_encryption_type         = optional(list(string), null)
    multichannel_enabled            = optional(bool, null)
  })
  default = null
}

variable "file_share_authentication" {
  description = "Storage Account file shares authentication configuration."
  type = object({
    directory_type = string
    active_directory = optional(object({
      storage_sid         = string
      domain_name         = string
      domain_sid          = string
      domain_guid         = string
      forest_name         = string
      netbios_domain_name = string
    }))
  })
  default = null

  validation {
    condition = var.file_share_authentication == null || (
      contains(["AADDS", "AD", ""], try(var.file_share_authentication.directory_type, ""))
    )
    error_message = "`file_share_authentication.directory_type` can only be `AADDS` or `AD`."
  }
  validation {
    condition = var.file_share_authentication == null || (
      try(var.file_share_authentication.directory_type, null) == "AADDS" || (
        try(var.file_share_authentication.directory_type, null) == "AD" &&
        try(var.file_share_authentication.active_directory, null) != null
      )
    )
    error_message = "`file_share_authentication.active_directory` block is required when `file_share_authentication.directory_type` is set to `AD`."
  }
}
