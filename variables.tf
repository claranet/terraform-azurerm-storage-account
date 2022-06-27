# Common

variable "client_name" {
  description = "Name of client"
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "location" {
}

variable "resource_group_name" {
}

variable "environment" {
}

variable "stack" {
}


# Storage account parameters

variable "account_tier" {
}

variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "replication_type" {
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}

variable "enable_https_traffic_only" {
  type    = string
  default = "true"
}

variable "custom_domain_name" {
  type    = string
  default = ""
}

variable "name_prefix" {
  description = "Optional prefix for storage account name"
  type        = string
  default     = ""
}

variable "container_access_type" {
  description = "he Access Level configured for this Container. Possible values are blob, container or private"
  type        = string
  default     = "private"
}

variable "static_website_config" {
  type    = list(map(string))
  default = []
}

variable "use_subdomain" {
  type    = bool
  default = false
}

variable "network_bypass" {
  description = "Specifies whether traffic is bypassed for 'Logging', 'Metrics', 'AzureServices' or 'None'"
  type        = list(string)
  default     = ["None"]
}

variable "ip_rules" {
  description = "IPs to allow access to that storage account"
  type        = list(string)
  default     = []
}

variable "containers" {
  description = "Containers to create on the storage account"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Subnets to allow access to that storage account"
  type        = list(string)
  default     = []
}

variable "default_firewall_action" {
  description = "Which default firewalling policy to apply. Valid values are Allow or Deny"
  default     = "Deny"
}

variable "min_tls_version" {
  default = "TLS1_2"
}
