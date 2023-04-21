resource "azurerm_storage_account_network_rules" "network_rules" {
  for_each = toset(var.network_rules_enabled && !var.nfsv3_enabled ? ["enabled"] : [])

  storage_account_id = azurerm_storage_account.storage.id

  default_action             = var.default_firewall_action
  bypass                     = var.network_bypass
  ip_rules                   = local.storage_ip_rules
  virtual_network_subnet_ids = var.default_firewall_action == "Deny" ? var.subnet_ids : []
  dynamic "private_link_access" {
    for_each = var.private_link_access
    content {
      endpoint_resource_id = private_link_access.value.endpoint_resource_id
      endpoint_tenant_id   = private_link_access.value.endpoint_tenant_id
    }
  }
}
