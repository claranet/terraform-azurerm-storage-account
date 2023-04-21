resource "azurerm_storage_share" "share" {
  for_each = try({ for s in var.file_shares : s.name => s }, {})

  storage_account_name = azurerm_storage_account.storage.name

  name  = each.key
  quota = each.value.quota_in_gb

  enabled_protocol = each.value.enabled_protocol
  metadata         = each.value.metadata

  dynamic "acl" {
    for_each = each.value.acl != null ? each.value.acl : []

    content {
      id = acl.value.id

      access_policy {
        permissions = acl.value.permissions
        start       = acl.value.start
        expiry      = acl.value.expiry
      }
    }
  }

  lifecycle {
    precondition {
      condition     = each.value.enabled_protocol == "NFS" ? var.account_tier == "Premium" : true
      error_message = "NFS file shares can only be enabled on Premium Storage Accounts."
    }
    precondition {
      condition     = var.account_tier != "Premium" || each.value.quota_in_gb >= 100
      error_message = "File share quota must be at least 100Gb for Premium Storage Accounts."
    }
  }
}
