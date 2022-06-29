output "storage_account_properties" {
  description = "Created storage account properties"
  value       = azurerm_storage_account.storage
}

output "storage_account_network_rules" {
  description = "Network rules of the associated Storage Account"
  value       = var.network_rules_enabled ? azurerm_storage_account_network_rules.network_rules["enabled"] : null
}
