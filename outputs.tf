output "resource" {
  description = "Storage Account resource object."
  value       = azurerm_storage_account.main
}

output "id" {
  description = "Storage Account ID."
  value       = azurerm_storage_account.main.id
}

output "name" {
  description = "Storage Account name."
  value       = azurerm_storage_account.main.name
}

output "identity_principal_id" {
  description = "Storage Account system identity principal ID."
  value       = try(azurerm_storage_account.main.identity[0].principal_id, null)
}

output "resource_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}

output "blob_containers" {
  description = "Created blob containers in the Storage Account."
  value       = azurerm_storage_container.main
}

output "file_shares" {
  description = "Created file shares in the Storage Account."
  value       = azurerm_storage_share.main
}

output "tables" {
  description = "Created tables in the Storage Account."
  value       = azurerm_storage_table.main
}

output "queues" {
  description = "Created queues in the Storage Account."
  value       = azurerm_storage_queue.main
}
