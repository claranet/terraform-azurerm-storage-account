resource "azurerm_storage_account_static_website" "main" {
  count = var.static_website_config != null ? 1 : 0

  storage_account_id = azurerm_storage_account.main.id

  index_document     = var.static_website_config.index_document
  error_404_document = var.static_website_config.error_404_document

  lifecycle {
    precondition {
      condition     = contains(["StorageV2", "BlockBlobStorage"], var.account_kind)
      error_message = "Static website can only be enabled when `account_kind` is set to `StorageV2` or `BlockBlobStorage`."
    }
  }
}
