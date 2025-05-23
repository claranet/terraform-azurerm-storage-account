output "resource" {
  description = "Storage Account resource object."
  value       = azurerm_storage_account.main
  sensitive   = true
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

output "module_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}

output "resource_blob_containers" {
  description = "Created blob containers in the Storage Account."
  value       = azurerm_storage_container.main
}

output "resource_file_shares" {
  description = "Created file shares in the Storage Account."
  value       = azurerm_storage_share.main
}

output "resource_tables" {
  description = "Created tables in the Storage Account."
  value       = azurerm_storage_table.main
}

output "resource_queues" {
  description = "Created queues in the Storage Account."
  value       = azurerm_storage_queue.main
}
