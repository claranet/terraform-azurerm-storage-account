resource "azurerm_storage_share" "share" {
  for_each = { for s in var.file_shares : s.name => s }

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
}
