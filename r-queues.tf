resource "azurerm_storage_queue" "main" {
  for_each = try({ for q in var.queues : q.name => q }, {})

  storage_account_name = azurerm_storage_account.main.name

  name     = each.key
  metadata = each.value.metadata
}

moved {
  from = azurerm_storage_queue.queue
  to   = azurerm_storage_queue.main
}
