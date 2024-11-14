variable "shared_access_key_enabled" {
  description = "Indicates whether the Storage Account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Entra ID)."
  type        = bool
  default     = false
  nullable    = false
}

variable "rbac_storage_contributor_role_principal_ids" {
  description = "The principal IDs of the users, groups, and service principals to assign the `Storage Account Contributor` role to."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "rbac_storage_blob_role_principal_ids" {
  description = "The principal IDs of the users, groups, and service principals to assign the `Storage Blob Data *` different roles to if Blob containers are created."
  type = object({
    owners       = optional(list(string), [])
    contributors = optional(list(string), [])
    readers      = optional(list(string), [])
  })
  default  = {}
  nullable = false
}

variable "rbac_storage_file_role_principal_ids" {
  description = "The principal IDs of the users, groups, and service principals to assign the `Storage File Data *` different roles to if File Shares are created."
  type = object({
    privileged_contributors = optional(list(string), [])
    privileged_readers      = optional(list(string), [])
    smb_owners              = optional(list(string), [])
    smb_contributors        = optional(list(string), [])
    smb_readers             = optional(list(string), [])
  })
  default  = {}
  nullable = false
}

variable "rbac_storage_table_role_principal_ids" {
  description = "The principal IDs of the users, groups, and service principals to assign the `Storage Table Data *` role to."
  type = object({
    contributors = optional(list(string), [])
    readers      = optional(list(string), [])
  })
  default  = {}
  nullable = false
}

variable "rbac_storage_queue_contributor_role_principal_ids" {
  description = "The principal IDs of the users, groups, and service principals to assign the `Storage Queue Data *` role to."
  type = object({
    contributors = optional(list(string), [])
    readers      = optional(list(string), [])
  })
  default  = {}
  nullable = false
}
