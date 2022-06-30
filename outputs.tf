output "storage_account_properties" {
  description = "Created storage account properties"
  value       = azurerm_storage_account.storage
}

output "storage_account_id" {
  description = "Created storage account ID"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "Created storage account name"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_identity" {
  description = "Created storage account Identity bloc"
  value       = azurerm_storage_account.storage.identity
}

output "storage_account_network_rules" {
  description = "Network rules of the associated Storage Account"
  value       = one(azurerm_storage_account_network_rules.network_rules[*])
}
