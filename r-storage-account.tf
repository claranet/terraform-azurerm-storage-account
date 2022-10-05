resource "azurerm_storage_account" "storage" {
  name                = local.sa_name
  resource_group_name = var.resource_group_name
  location            = var.location

  access_tier              = var.access_tier
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type

  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = var.public_nested_items_allowed
  shared_access_key_enabled       = var.shared_access_key_enabled
  nfsv3_enabled                   = var.nfsv3_enabled
  enable_https_traffic_only       = var.nfsv3_enabled ? false : var.https_traffic_only_enabled
  is_hns_enabled                  = var.nfsv3_enabled ? true : var.hns_enabled
  large_file_share_enabled        = var.account_kind != "BlockBlobStorage"

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["enabled"]
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids == "UserAssigned" ? var.identity_ids : null
    }
  }

  dynamic "static_website" {
    for_each = var.static_website_config == null ? [] : ["enabled"]
    content {
      index_document     = var.static_website_config.index_document
      error_404_document = var.static_website_config.error_404_document
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
    for_each = var.storage_blob_data_protection != null || var.storage_blob_cors_rule != null ? ["enabled"] : []

    content {
      change_feed_enabled = var.nfsv3_enabled ? false : var.storage_blob_data_protection.change_feed_enabled
      versioning_enabled  = var.nfsv3_enabled ? false : var.storage_blob_data_protection.versioning_enabled

      dynamic "cors_rule" {
        for_each = var.storage_blob_cors_rule != null ? ["enabled"] : []
        content {
          allowed_headers    = var.storage_blob_cors_rule.allowed_headers
          allowed_methods    = var.storage_blob_cors_rule.allowed_methods
          allowed_origins    = var.storage_blob_cors_rule.allowed_origins
          exposed_headers    = var.storage_blob_cors_rule.exposed_headers
          max_age_in_seconds = var.storage_blob_cors_rule.max_age_in_seconds
        }
      }

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

  dynamic "queue_properties" {
    for_each = var.queue_properties_logging != null ? ["enabled"] : []
    content {
      logging {
        delete                = var.queue_properties_logging.delete
        read                  = var.queue_properties_logging.read
        write                 = var.queue_properties_logging.write
        version               = var.queue_properties_logging.version
        retention_policy_days = var.queue_properties_logging.retention_policy_days
      }
    }
  }

  dynamic "network_rules" {
    for_each = var.nfsv3_enabled ? ["enabled"] : []
    content {
      default_action             = "Deny"
      bypass                     = var.network_bypass
      ip_rules                   = local.storage_ip_rules
      virtual_network_subnet_ids = var.subnet_ids
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}

resource "azurerm_advanced_threat_protection" "threat_protection" {
  enabled            = var.advanced_threat_protection_enabled
  target_resource_id = azurerm_storage_account.storage.id
}
