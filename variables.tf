# Common

variable "location_short" {
  description = "Short string for Azure location"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
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

variable "enable_https_traffic_only" {
  type    = string
  default = "true"
}

variable "custom_domain_name" {
  type    = string
  default = ""
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
