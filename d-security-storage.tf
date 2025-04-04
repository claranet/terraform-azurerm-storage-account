data "azurerm_subscription" "current" {
}

data "azapi_resource" "security_storage" {
  type      = "Microsoft.Security/pricings@2024-01-01"
  name      = "StorageAccounts"
  parent_id = data.azurerm_subscription.current.id

  response_export_values = ["properties.subPlan"]
}
