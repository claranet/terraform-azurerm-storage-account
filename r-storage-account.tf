resource "azurerm_storage_account" "storage" {
  name                = local.sa_name
  resource_group_name = var.resource_group_name
  location            = var.location

  access_tier               = var.access_tier
  account_tier              = var.account_tier
  account_kind              = var.account_kind
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  min_tls_version = var.min_tls_version

  dynamic "static_website" {
    for_each = var.static_website_config
    content {
      index_document     = lookup(static_website.value, "index_document", null)
      error_404_document = lookup(static_website.value, "error_404_document", null)
    }
  }

  dynamic "custom_domain" {
    for_each = var.custom_domain_name != null ? ["enabled"] : []
    content {
      name          = var.custom_domain_name
      use_subdomain = var.use_subdomain
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}
