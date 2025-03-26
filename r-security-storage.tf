moved {
  from = azurerm_advanced_threat_protection.main
  to   = azurerm_advanced_threat_protection.main[0]
}

# The Defender for Storage `classic` = `PerTransaction` plan is no longer available for new subscriptions and storage accounts. This is kept only for retro-compatibility.
resource "azurerm_advanced_threat_protection" "main" {
  count = local.security_storage_plan == "PerTransaction" ? 1 : 0

  enabled            = var.advanced_threat_protection_enabled
  target_resource_id = azurerm_storage_account.main.id
}

# Override the Defender for Cloud Storage settings defined for the subscription. Not possible to create the resource if the storage account is using the `PerTransaction` = `classic` plan. If that's the case please move to [the new Defender for Storage plan](https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-storage-classic-migrate).
resource "azurerm_security_center_storage_defender" "main" {
  count = var.storage_defender_override_subscription_settings != null && local.security_storage_plan != "PerTransaction" ? 1 : 0

  storage_account_id = azurerm_storage_account.main.id

  override_subscription_settings_enabled      = true
  malware_scanning_on_upload_enabled          = var.storage_defender_override_subscription_settings.malware_scanning_on_upload_enabled
  malware_scanning_on_upload_cap_gb_per_month = var.storage_defender_override_subscription_settings.malware_scanning_on_upload_cap_gb_per_month
  scan_results_event_grid_topic_id            = var.storage_defender_override_subscription_settings.scan_results_event_grid_topic_id
  sensitive_data_discovery_enabled            = var.storage_defender_override_subscription_settings.sensitive_data_discovery_enabled
}
