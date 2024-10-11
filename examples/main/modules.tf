module "storage_account" {
  source  = "claranet/storage-account/azurerm"
  version = "x.x.x"

  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  environment    = var.environment
  stack          = var.stack

  resource_group_name = module.rg.name

  allowed_cidrs = [format("%s/32", data.http.my_ip.body)]

  account_replication_type = "LRS"

  storage_blob_data_protection = {
    change_feed_enabled                       = true
    versioning_enabled                        = true
    delete_retention_policy_in_days           = 42
    container_delete_retention_policy_in_days = 42
    container_point_in_time_restore           = true
  }

  # Disabled by default
  storage_blob_cors_rules = [{
    allowed_headers    = ["*"]
    allowed_methods    = ["GET", "HEAD"]
    allowed_origins    = ["https://example.com"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }]

  logs_destinations_ids = [
    # module.run.logs_storage_account_id,
    # module.run.log_analytics_workspace_id,
  ]

  # Set by default
  queue_properties_logging = {
    delete                = true
    read                  = true
    write                 = true
    version               = "1.0"
    retention_policy_days = 10
  }

  containers = [
    {
      name = "container1"
    },
    {
      name = "container2"
      # container_access_type = "blob"
    }
  ]

  file_shares = [
    {
      name        = "share1smb"
      quota_in_gb = 50
    }
  ]

  tables = [
    {
      name = "table1"
    }
  ]

  queues = [
    {
      name = "queue1"
    }
  ]

  extra_tags = {
    foo = "bar"
  }
}
