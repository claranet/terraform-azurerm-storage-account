output "storage_account_storage_primary_connection_string" {
  value = azurerm_storage_account.storage.primary_connection_string
}

output "storage_account_storage_primary_access_key" {
  value = azurerm_storage_account.storage.primary_access_key
}

output "storage_account_storage_secondary_connection_string" {
  value = azurerm_storage_account.storage.secondary_connection_string
}

output "name" {
  value = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}

output "secondary_blob_endpoint" {
  value = azurerm_storage_account.storage.secondary_blob_endpoint
}

output "resource_group_name" {
  value = var.resource_group_name
}

output "id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_containers" {
  value = azurerm_storage_container.container.name
}