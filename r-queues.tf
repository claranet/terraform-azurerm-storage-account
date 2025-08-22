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

resource "azurerm_storage_account_queue_properties" "main" {
  count = var.queue_properties_logging != null && contains(["Storage", "StorageV2"], var.account_kind) ? 1 : 0

  storage_account_id = azurerm_storage_account.main.id
  logging {
    delete                = var.queue_properties_logging.delete
    read                  = var.queue_properties_logging.read
    write                 = var.queue_properties_logging.write
    version               = var.queue_properties_logging.version
    retention_policy_days = var.queue_properties_logging.retention_policy_days
  }
}
