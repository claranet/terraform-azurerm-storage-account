resource "azurerm_storage_account" "storage" {
  name                = coalesce(var.storage_account_name, local.default_storage_account_name)
  resource_group_name = var.resource_group_name
  location            = var.location

  access_tier               = var.access_tier
  account_tier              = var.account_tier
  account_kind              = var.account_kind
  account_replication_type  = var.replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  min_tls_version = var.min_tls_version

  dynamic "static_website" {
    for_each = var.static_website_config
    content {
      index_document     = lookup(static_website.value, "index_document")
      error_404_document = lookup(static_website.value, "error_404_document")
    }
  }

  custom_domain {
    name          = var.custom_domain_name
    use_subdomain = var.use_subdomain
  }

  tags = merge(local.default_tags, var.extra_tags)
}
