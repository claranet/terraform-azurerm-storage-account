resource "azurerm_role_assignment" "sta_contributor" {
  for_each = toset(var.rbac_storage_contributor_role_principal_ids)

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_blob_owner" {
  for_each = toset(length(var.containers) > 0 ? var.rbac_storage_blob_role_principal_ids.blob_owners : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_blob_contributor" {
  for_each = toset(length(var.containers) > 0 ? var.rbac_storage_blob_role_principal_ids.blob_contributors : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_blob_reader" {
  for_each = toset(length(var.containers) > 0 ? var.rbac_storage_blob_role_principal_ids.blob_readers : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_priv_contributor" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.file_data_privileged_contributors : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data Privileged Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_priv_reader" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.file_data_privileged_readers : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data Privileged Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_smb_owner" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.file_data_smb_owners : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data SMB Share Elevated Contributor"
  principal_id         = each.value
}


resource "azurerm_role_assignment" "sta_file_smb_contributor" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.file_data_smb_contributors : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_smb_reader" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.file_data_smb_readers : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data SMB Share Reader"
  principal_id         = each.value
}
