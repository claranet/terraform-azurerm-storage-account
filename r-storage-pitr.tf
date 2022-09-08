# Enable point-in-time restore (PITR) for this Blob Storage.
# This feature is not yet supported by the AzureRM provider.
# https://github.com/hashicorp/terraform-provider-azurerm/issues/9020
resource "azapi_update_resource" "sa_pitr" {
  for_each = toset(
    var.storage_blob_data_protection.container_point_in_time_restore
    && var.storage_blob_data_protection.container_delete_retention_policy_in_days > 2
    && !var.nfsv3_enabled ? ["enabled"] : []
  )

  type      = "Microsoft.Storage/storageAccounts/blobServices@2021-09-01"
  parent_id = azurerm_storage_account.storage.id
  name      = "default"

  body = jsonencode({
    properties = {
      restorePolicy = {
        enabled = true
        days    = var.storage_blob_data_protection.container_delete_retention_policy_in_days - 1
      }
    }
  })
}
