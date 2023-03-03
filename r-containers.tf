resource "azurerm_storage_container" "container" {
  for_each = try({ for c in var.containers : c.name => c }, {})

  storage_account_name = azurerm_storage_account.storage.name

  name                  = each.key
  container_access_type = each.value.container_access_type
  metadata              = each.value.metadata
}
