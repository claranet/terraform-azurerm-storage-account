resource "azurerm_storage_account_network_rules" "network_rules" {
  storage_account_name       = azurerm_storage_account.storage.name
  resource_group_name        = var.resource_group_name
  default_action             = var.default_firewall_action
  bypass                     = var.network_bypass
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = var.default_firewall_action == "Deny" ? var.subnet_ids : []
}