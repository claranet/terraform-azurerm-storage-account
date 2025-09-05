module "diagnostics" {
  source  = "claranet/diagnostic-settings/azurerm"
  version = "~> 8.2.0"

  resource_id = azurerm_storage_account.main.id

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories

  custom_name = var.diagnostic_settings_custom_name
  name_prefix = var.name_prefix
  name_suffix = var.name_suffix
}

module "diagnostics_type" {
  for_each = toset(["blob", "file", "table", "queue"])

  source  = "claranet/diagnostic-settings/azurerm"
  version = "~> 8.2.0"

  resource_id = format("%s/%sServices/default/", azurerm_storage_account.main.id, each.key)

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories

  custom_name = var.diagnostic_settings_custom_name
  name_prefix = var.name_prefix
  name_suffix = var.name_suffix
}
