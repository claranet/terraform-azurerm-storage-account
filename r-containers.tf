resource "azurerm_storage_container" "container" {
  for_each = { for c in var.containers : c.name => c }

  storage_account_name = azurerm_storage_account.storage.name

  name                  = each.key
  container_access_type = coalesce(each.value.container_access_type, "private")
  metadata              = each.value.metadata
}
