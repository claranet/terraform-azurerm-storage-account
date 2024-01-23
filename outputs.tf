output "storage_account_properties" {
  description = "Created Storage Account properties."
  value       = azurerm_storage_account.storage
  sensitive   = true
}

output "storage_account_id" {
  description = "Created Storage Account ID."
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "Created Storage Account name."
  value       = azurerm_storage_account.storage.name
}

output "storage_account_identity" {
  description = "Created Storage Account identity block."
  value       = azurerm_storage_account.storage.identity
}

output "storage_account_network_rules" {
  description = "Network rules of the associated Storage Account."
  value = try(
    one(azurerm_storage_account_network_rules.network_rules[*].enabled),
    azurerm_storage_account.storage.network_rules[0],
  )
}

output "storage_blob_containers" {
  description = "Created blob containers in the Storage Account."
  value       = azurerm_storage_container.container
}

output "storage_file_shares" {
  description = "Created file shares in the Storage Account."
  value       = azurerm_storage_share.share
}

output "storage_file_tables" {
  description = "Created tables in the Storage Account."
  value       = azurerm_storage_table.table
}

output "storage_file_queues" {
  description = "Created queues in the Storage Account."
  value       = azurerm_storage_queue.queue
}
