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

  logs_destinations_ids = [
    # module.run.logs_storage_account_id,
    # module.run.log_analytics_workspace_id,
  ]

  # This require Administrator rights on the tenant
  # See https://learn.microsoft.com/en-us/azure/storage/files/storage-files-identity-auth-active-directory-domain-service-enable?tabs=azure-portal#prerequisites
  file_share_authentication = {
    directory_type = "AADDS"
  }

  file_shares = [
    {
      name        = "share1smb"
      quota_in_gb = 50
    }
  ]

  extra_tags = {
    foo = "bar"
  }
}
