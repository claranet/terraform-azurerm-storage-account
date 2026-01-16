## 8.6.7 (2026-01-16)

### Bug Fixes

* **AZ-1631:** 🐛 add ignore_changes for smb in share_properties 903df30

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.11.2 5a33ef6
* **deps:** update dependency opentofu to v1.11.3 8d76afc
* **deps:** update dependency pre-commit to v4.5.1 dba93b3
* **deps:** update dependency trivy to v0.68.2 8b65365
* **deps:** update pre-commit hook crate-ci/committed to v1.1.10 5c306a6
* **deps:** update pre-commit hook crate-ci/committed to v1.1.9 9c0b556

## 8.6.6 (2025-12-15)

### Bug Fixes

* **trivy:** 🐛🔒️ ignore trivy rule for option managed by input variables edc4920

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.10.7 c8c16fd
* **deps:** update dependency pre-commit to v4.4.0 2a5758c
* **deps:** update dependency pre-commit to v4.5.0 dad3e25
* **deps:** update dependency tflint to v0.60.0 a47fa8a
* **deps:** update dependency trivy to v0.67.2 b3a6e8d
* **deps:** update dependency trivy to v0.68.1 fcf37a4
* **deps:** update pre-commit hook crate-ci/committed to v1.1.8 1277875
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.2 8950624
* **deps:** update tools c340eb9

## 8.6.5 (2025-10-10)

### Documentation

* 📚️ update module examples 1ef53ea

### Code Refactoring

* **deps:** 🔗 update claranet/azurecaf to ~> 1.3.0 🔧 e1c5ae7

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.10.6 5ea5d60
* **deps:** update dependency trivy to v0.66.0 15c4278
* **deps:** update dependency trivy to v0.67.0 8cdb0d3
* **deps:** update dependency trivy to v0.67.1 ccfe191
* **deps:** update terraform claranet/diagnostic-settings/azurerm to ~> 8.2.0 7869808
* merge remote-tracking branch 'origin/renovate/tools' 970a16d

## 8.6.4 (2025-09-01)

### Bug Fixes

* 🐛 bump diagnostics ed3d467

### Miscellaneous Chores

* **deps:** 🔗 bump AzureRM provider version to v4.31+ a492cbe
* **deps:** update dependency claranet/diagnostic-settings/azurerm to ~> 8.1.0 b95a373
* **deps:** update dependency tflint to v0.59.1 f7ec06e

## 8.6.3 (2025-08-22)

### Code Refactoring

* ♻️ drop deprecated queues_properties bloc and use `azurerm_storage_account_queue_properties` 0a625a4

### Miscellaneous Chores

* **deps:** 🔗 bump AzureRM provider for the new resource `azurerm_storage_account_queue_properties` 15fbafb

## 8.6.2 (2025-08-20)

### Bug Fixes

* update `large_file_share_enabled` condition for storage account b7d78f6

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.10.3 8fe0971
* **deps:** update dependency tflint to v0.58.1 de97aa8
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v6 dc26c1c
* **deps:** update tools b2a707e
* **deps:** update tools 553fcab

## 8.6.1 (2025-07-11)

### Bug Fixes

* **AZ-1583:** update large_file_share_enabled condition 4bd7021

### Miscellaneous Chores

* **⚙️:** ✏️ update template identifier for MR review 38d236e
* 🗑️ remove old commitlint configuration files e422c05
* **deps:** update dependency opentofu to v1.10.0 bf7b8b5
* **deps:** update dependency opentofu to v1.10.1 812592a
* **deps:** update dependency tflint to v0.58.0 4383506
* **deps:** update dependency trivy to v0.63.0 682e87b
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.1 a79366c
* **deps:** update tools 27b7b22

## 8.6.0 (2025-05-23)

### Features

* remove force deny in network rules when nfsv3 enabled 39fd56a

## 8.5.1 (2025-05-23)

### Bug Fixes

* **AZ-1563:** remove storage_account_name deprecated parameter in the storage share resource 85370b2

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.9.1 1a9d099
* **deps:** update dependency terraform-docs to v0.20.0 c221258
* **deps:** update dependency tflint to v0.57.0 f89f3c5
* **deps:** update dependency trivy to v0.61.1 214fa89
* **deps:** update dependency trivy to v0.62.0 025ca06
* **deps:** update dependency trivy to v0.62.1 60b19ce

## 8.5.0 (2025-04-04)

### Features

* **AZ-1545:** add defender_storage_settings and deprecate azurerm_advanced_threat_protection d277a48

### Miscellaneous Chores

* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.0 7571e45
* **deps:** update tools 185460c

## 8.4.0 (2025-03-21)

### Features

* **AZ-1542:** add allowed_copy_scope parameter 562d557
* **AZ-1542:** add allowed_copy_scope parameter 5c70ea9

### Miscellaneous Chores

* **AZ-1542:** fix validation condition and message fdcd71a
* **deps:** update dependency pre-commit to v4.2.0 df1553f
* **deps:** update dependency tflint to v0.55.1 2385234
* **deps:** update dependency trivy to v0.59.0 f9feec5
* **deps:** update dependency trivy to v0.59.1 059e953
* **deps:** update dependency trivy to v0.60.0 4a7889a
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.21.0 9595d87
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.22.0 d0988c6
* update Github templates 551c8da

## 8.3.0 (2025-01-24)

### Features

* **AZ-1499:** add change_feed_retention_in_days parameter 03c6fa3

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.9.0 3930c3f
* **deps:** update dependency pre-commit to v4.1.0 2a15579
* **deps:** update dependency tflint to v0.55.0 123b49d
* **deps:** update dependency trivy to v0.58.2 3e3dd00
* update tflint config for v0.55.0 74e0337

## 8.2.2 (2025-01-08)

### Bug Fixes

* ensure `storage_ip_rules` regexall only matches /31 and /32, but leaves /30 alone since it is valid 8fce7a8

### Code Refactoring

* update locals.tf 7b3ff63

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.8 1fa5181
* **deps:** update dependency trivy to v0.58.1 56b4803
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 af4dda1

## 8.2.1 (2024-12-06)

### Bug Fixes

* **AZ-1088:** less restrictive role assignments 2feaf30

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.6 2570df6
* **deps:** update dependency trivy to v0.57.1 cb840c3
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 bcb0f9a
* **deps:** update tools 33f3127

## 8.2.0 (2024-11-15)

### Features

* storage_account_name parameter is deprecated for storage_container resource bdeb347

## 8.1.0 (2024-11-14)

### Features

* **AZ-1088:** also add Table & Queue Data roles af9d2e9
* **AZ-1088:** handle optional RBAC Storage Roles assignments 918659c

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.4 c7cf318
* **deps:** update dependency tflint to v0.54.0 b77b14d
* **deps:** update tools dd43478

## 8.0.0 (2024-10-18)

### ⚠ BREAKING CHANGES

* **AZ-1088:** `shared_access_key_enabled` should be disabled and use Entra ID RBAC instead
* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** module v8 structure and updates a64a02b

### Code Refactoring

* **AZ-1088:** variable `shared_access_key_enabled` is now `[secure]` by default 4804ab5

### Miscellaneous Chores

* apply suggestion(s) to file(s) 08314a4
* **deps:** update dependency claranet/diagnostic-settings/azurerm to v8 110a9dd
* **deps:** update dependency opentofu to v1.8.3 5539734
* **deps:** update dependency pre-commit to v4 1bf68ab
* **deps:** update dependency pre-commit to v4.0.1 198b207
* **deps:** update dependency trivy to v0.56.1 88a3c81
* **deps:** update dependency trivy to v0.56.2 8b139cd
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 206d928
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 de21376
* **deps:** update terraform claranet/diagnostic-settings/azurerm to v7 05176cc
* prepare for new examples structure d06185b
* update examples structure a428722

## 7.14.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider 14c01ef

### Documentation

* update README badge to use OpenTofu registry 0ac5c9e
* update README with `terraform-docs` v0.19.0 92d290f

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.2 31122ac
* **deps:** update dependency terraform-docs to v0.19.0 f6db296
* **deps:** update dependency trivy to v0.55.0 1ce0a98
* **deps:** update dependency trivy to v0.55.1 5c81cef
* **deps:** update dependency trivy to v0.55.2 7eac1f3
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 c1b6d85
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 a3abcce
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 826da66
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 235f9b5
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 6600710
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 7a93609
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 09f8a40
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 e98f751
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 d0b2222
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 e28a03b
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 516e113

## 7.13.3 (2024-08-19)

### Bug Fixes

* **GH-17:** deprecated `enable_https_traffic_only` as been superseded by `https_traffic_only_enabled` 49aa3c6

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.1 7f2b37b
* **deps:** update tools 6890592

## 7.13.2 (2024-08-05)


### Bug Fixes

* **AZ-1446:** remove `storage_account_network_rules` output 6224f62


### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.7.3 8c8506c
* **deps:** update dependency pre-commit to v3.8.0 a5ebfb0
* **deps:** update dependency tflint to v0.51.2 caea776
* **deps:** update dependency tflint to v0.52.0 9650027
* **deps:** update dependency trivy to v0.53.0 7195a9b
* **deps:** update dependency trivy to v0.54.1 ed108bc
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 489348e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 20dd7fa
* **deps:** update tools 1b67755

## 7.13.1 (2024-06-14)


### Bug Fixes

* fix `identity` block 787d90c


### Miscellaneous Chores

* **deps:** update dependency trivy to v0.52.2 d308803

## 7.13.0 (2024-06-14)


### Features

* add variables infrastructure_encryption_enabled, customer_managed_key; fix identity_ids 0e20af8


### Documentation

* update README, revert output changes 68e6099


### Miscellaneous Chores

* apply suggestions from code review 86e910e
* **deps:** update dependency opentofu to v1.7.1 33ec93a
* **deps:** update dependency opentofu to v1.7.2 937472a
* **deps:** update dependency pre-commit to v3.7.1 af64f9d
* **deps:** update dependency terraform-docs to v0.18.0 c44f231
* **deps:** update dependency tflint to v0.51.1 f9db5a6
* **deps:** update dependency trivy to v0.51.0 eb6a1cc
* **deps:** update dependency trivy to v0.51.1 87b766e
* **deps:** update dependency trivy to v0.51.2 15c9c2b
* **deps:** update dependency trivy to v0.51.4 4fa6c2f
* **deps:** update dependency trivy to v0.52.0 bf0f05d
* **deps:** update dependency trivy to v0.52.1 5d29abb
* the `managed_hsm_key_id` requires provider `v3.102` a416c1f

## 7.12.0 (2024-05-03)


### Features

* **GH-9:** change `storage_blob_cors_rule` to a list, allow multiple cors rules 6ac1267


### Miscellaneous Chores

* **deps:** enable automerge on renovate ad8d72c
* **deps:** update dependency opentofu to v1.7.0 ad5959b
* **deps:** update dependency tflint to v0.51.0 6008dc9
* **deps:** update dependency trivy to v0.50.2 51eb028
* **deps:** update dependency trivy to v0.50.4 297b235
* **pre-commit:** update commitlint hook 1edef34
* **release:** remove legacy `VERSION` file 03f491b

## 7.11.1 (2024-04-19)


### Bug Fixes

* **AZ-1395:** precondition for premium account_tier 608a448


### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] 172522f
* **AZ-1391:** update semantic-release config [skip ci] df8c7e1

# v7.11.0 - 2024-03-29

Added
  * [GH-14](https://github.com/claranet/terraform-azurerm-storage-account/issues/14): add `public_network_access_enabled` parameter

# v7.10.0 - 2023-12-22

Added
  * AZ-1317: Add a precondition to disallow PITR on Premium storage accounts

# v7.9.0 - 2023-12-08

Added
  * AZ-1292: Add `cross_tenant_replication_enabled` parameter for enabling cross tenant replication support

# v7.8.0 - 2023-09-01

Breaking
  * AZ-1153: Remove `retention_days` parameters, it must be handled at destination level now. (for reference: [Provider issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/23051))

# v7.7.0 - 2023-05-26

Added
  * [GH-6](https://github.com/claranet/terraform-azurerm-storage-account/issues/6): Expose `last_access_time_enabled` variable within blob data protection

# v7.6.1 - 2023-05-12

Fixed
  * AZ-1079: Fix example

# v7.6.0 - 2023-04-21

Added
  * AZ-1065: Add private_link_access option
  * [GH-4](https://github.com/claranet/terraform-azurerm-storage-account/issues/4): Add an example with multiple storage accounts

Fixed
  * AZ-996: Ensure Premium file shares have a minimum size of 100Gb

# v7.5.0 - 2023-03-03

Added
  * AZ-924: Add support for SFTP

# v7.4.1 - 2023-02-08

Fixed
  * AZ-995: Do not enable large file if account replication is not `LRS` or `ZRS`

# v7.4.0 - 2022-12-23

Fixed
  * AZ-964: Fix permanent drift since support for the `blob_properties.restore_policy` property (point-in-time restore) in the Terraform provider AzureRM `v3.36.0`

# v7.3.0 - 2022-11-24

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

Added
  * AZ-891: Add Azure File authentication block (AD/AADDS)

# v7.2.0 - 2022-11-10

Fixed
  * [GH-2](https://github.com/claranet/terraform-azurerm-storage-account/pull/2): Enable logging only if queues are used/created

Changed
  * AZ-130: Module code improvements, bump `diagnostics` module for sub-entities
  * AZ-130: `network_bypass` is now set to `'Logging', 'Metrics', 'AzureServices'` by default

# v7.1.0 - 2022-10-21

Added
  * [GH-2](https://github.com/claranet/terraform-azurerm-storage-account/pull/2): Enable logging for Queue Services
  * AZ-869: Add file share properties related variables

Changed
  * AZ-846: Bump diagnostic settings module version

Fixed
  * AZ-869: Fix PITR & blob data protection conditions

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
