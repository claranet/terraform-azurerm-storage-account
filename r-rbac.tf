# https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/storage

resource "azurerm_role_assignment" "sta_contributor" {
  for_each = toset(var.rbac_storage_contributor_role_principal_ids)

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_blob_owner" {
  for_each = toset(length(var.containers) > 0 ? var.rbac_storage_blob_role_principal_ids.owners : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_blob_contributor" {
  for_each = toset(length(var.containers) > 0 ? var.rbac_storage_blob_role_principal_ids.contributors : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_blob_reader" {
  for_each = toset(length(var.containers) > 0 ? var.rbac_storage_blob_role_principal_ids.readers : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_priv_contributor" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.privileged_contributors : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data Privileged Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_priv_reader" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.privileged_readers : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data Privileged Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_smb_owner" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.smb_owners : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data SMB Share Elevated Contributor"
  principal_id         = each.value
}


resource "azurerm_role_assignment" "sta_file_smb_contributor" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.smb_contributors : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_file_smb_reader" {
  for_each = toset(length(var.file_shares) > 0 ? var.rbac_storage_file_role_principal_ids.smb_readers : [])

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage File Data SMB Share Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_table_contributor" {
  for_each = toset(var.rbac_storage_table_role_principal_ids.contributors)

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Table Data Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_table_reader" {
  for_each = toset(var.rbac_storage_table_role_principal_ids.readers)

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Table Data Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_queue_contributor" {
  for_each = toset(var.rbac_storage_queue_contributor_role_principal_ids.contributors)

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sta_queue_reader" {
  for_each = toset(var.rbac_storage_queue_contributor_role_principal_ids.readers)

  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Queue Data Reader"
  principal_id         = each.value
}
