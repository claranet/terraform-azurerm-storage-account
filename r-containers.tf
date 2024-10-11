resource "azurerm_storage_container" "main" {
  for_each = try({ for c in var.containers : c.name => c }, {})

  storage_account_name = azurerm_storage_account.main.name

  name                  = each.key
  container_access_type = each.value.container_access_type
  metadata              = each.value.metadata
}

moved {
  from = azurerm_storage_container.container
  to   = azurerm_storage_container.main
}
