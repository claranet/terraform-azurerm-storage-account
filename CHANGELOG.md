# Unreleased

Added
  * [GH-2](https://github.com/claranet/terraform-azurerm-storage-account/pull/2): Enable logging for Queue Services

# v7.0.1 - 2022-10-07

Fixed
  * AZ-865: Fix Soft Delete for NFS 3.0 with Blob Storage

# v7.0.0 - 2022-09-23

Breaking
  * AZ-840: Upgrade to Terraform 1.3+

Changed
  * AZ-839: Bump `diagnostics` module

# v6.2.0 - 2022-09-16

Added
  * [GH-1](https://github.com/claranet/terraform-azurerm-storage-account/pull/1/): Add CORS rules option

# v6.1.1 - 2022-09-02

Fixed
  * AZ-836: Fix `large_file_share_enabled` parameter when `account_kind = "BlockBlobStorage"`

# v6.1.0 - 2022-08-12

Added
  * AZ-820: Add `is_hns_enabled` parameter

Fixed
  * AZ-823: Fix NFS 3.0 support with Blob Storage

# v6.0.0 - 2022-08-05

Added
  * AZ-130: Module Azure storage account - first release
  * AZ-504: Adding diagnostic logging
  * AZ-515: Compatible with CAF Naming
  * AZ-615: Add an option to enable or disable default tags
  * AZ-717: Compatible with Terraform 1+ and AzureRM provider v3+
