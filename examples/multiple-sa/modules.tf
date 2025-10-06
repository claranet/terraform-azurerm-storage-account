locals {
  sa_list = {
    app1 = ["containerA", "containerB", ]
    st2  = ["dir-xx", "dir-yy", ]
  }
}

module "storage_account" {
  source  = "claranet/storage-account/azurerm"
  version = "x.x.x"

  for_each = local.sa_list

  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  environment    = var.environment
  stack          = var.stack

  resource_group_name = module.rg.name

  account_replication_type = "LRS"

  name_suffix = each.key

  containers = [
    for container_name in each.value :
    {
      name = container_name
    }
  ]

  blob_data_protection = {
    change_feed_enabled                       = true
    versioning_enabled                        = true
    delete_retention_policy_in_days           = 42
    container_delete_retention_policy_in_days = 42
    container_point_in_time_restore           = true
  }

  logs_destinations_ids = [
    # module.logs.logs_storage_account_id,
    # module.logs.log_analytics_workspace_id,
  ]

  extra_tags = {
    foo = "bar"
  }
}
