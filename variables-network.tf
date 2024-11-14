# Storage Firewall

variable "network_rules_enabled" {
  description = "Boolean to enable Network Rules on the Storage Account, requires `network_bypass`, `allowed_cidrs`, `subnet_ids` or `default_firewall_action` correctly set if enabled."
  type        = bool
  default     = true
}

variable "network_bypass" {
  description = "Specifies whether traffic is bypassed for 'Logging', 'Metrics', 'AzureServices' or 'None'."
  type        = list(string)
  default     = ["Logging", "Metrics", "AzureServices"]
}

variable "allowed_cidrs" {
  description = "List of CIDR to allow access to that Storage Account."
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Subnets to allow access to that Storage Account."
  type        = list(string)
  default     = []
}

variable "default_firewall_action" {
  description = "Which default firewalling policy to apply. Valid values are `Allow` or `Deny`."
  type        = string
  default     = "Deny"
}

variable "private_link_access" {
  description = "List of Privatelink objects to allow access from."
  type = list(object({
    endpoint_resource_id = string
    endpoint_tenant_id   = optional(string, null)
  }))
  default  = []
  nullable = false
}

variable "public_nested_items_allowed" {
  description = "Allow or disallow nested items within this Account to opt into being public."
  type        = bool
  default     = false
  nullable    = false
}

variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled."
  type        = bool
  default     = true
  nullable    = false
}
