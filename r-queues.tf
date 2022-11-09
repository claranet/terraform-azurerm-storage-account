resource "azurerm_storage_queue" "queue" {
  for_each = try({ for q in var.queues : q.name => q }, {})

  storage_account_name = azurerm_storage_account.storage.name

  name     = each.key
  metadata = each.value.metadata
}
