resource "azurerm_storage_account" "storage" {
  name                = local.sa_name
  resource_group_name = var.resource_group_name
  location            = var.location

  access_tier              = var.access_tier
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type

  enable_https_traffic_only       = var.https_traffic_only_enabled
  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  shared_access_key_enabled       = var.shared_access_key_enabled

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["enabled"]
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids == "UserAssigned" ? var.identity_ids : null
    }
  }

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

  dynamic "blob_properties" {
    for_each = var.storage_blob_data_protection != null ? ["enabled"] : []

    content {
      change_feed_enabled = var.storage_blob_data_protection.change_feed_enabled
      versioning_enabled  = var.storage_blob_data_protection.versioning_enabled
      dynamic "delete_retention_policy" {
        for_each = var.storage_blob_data_protection.delete_retention_policy_in_days > 0 ? ["enabled"] : []
        content {
          days = var.storage_blob_data_protection.delete_retention_policy_in_days
        }
      }
      dynamic "container_delete_retention_policy" {
        for_each = var.storage_blob_data_protection.container_delete_retention_policy_in_days > 0 ? ["enabled"] : []
        content {
          days = var.storage_blob_data_protection.container_delete_retention_policy_in_days
        }
      }
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}

resource "azurerm_advanced_threat_protection" "threat_protection" {
  enabled            = var.advanced_threat_protection_enabled
  target_resource_id = azurerm_storage_account.storage.id
}
