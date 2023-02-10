#============================================================
# Resource Group
#============================================================
data "azurerm_resource_group" "resource_group_name" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "resource_group" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.storage_region_name
  tags     = var.storage_tags
}

#============================================================
# Storage Account
#============================================================
resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.resource_group.name
  location                  = var.storage_region_name
  account_kind              = var.storage_account_type
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_account_replication_type
  enable_https_traffic_only = true
  min_tls_version           = var.storage_min_tls_version
  tags                      = var.storage_tags

  blob_properties {
    delete_retention_policy {
      days = var.blob_soft_delete_retention_days
    }
    container_delete_retention_policy {
      days = var.container_soft_delete_retention_days
    }
    versioning_enabled       = var.blob_enable_versioning
    last_access_time_enabled = var.last_access_time_enabled
    change_feed_enabled      = var.change_feed_enabled
  }
}

resource "azurerm_storage_account_network_rules" "network_rules" {
  storage_account_id = azurerm_storage_account.storage_account.id

  default_action             = "Allow"
  ip_rules                   = [var.storage_network_ips]
  bypass                     = ["Metrics"]
}

#============================================================
# Storage Advanced Threat Protection
#============================================================
resource "azurerm_advanced_threat_protection" "adv_threat_protect" {
  target_resource_id = azurerm_storage_account.storage_account.id
  enabled            = var.enable_advanced_threat_protection
}

#============================================================
# Storage Container Creation
#============================================================
resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"
}

#============================================================
# Storage Lifecycle Management
#============================================================
resource "azurerm_storage_management_policy" "lifecycle_policy" {
  storage_account_id = azurerm_storage_account.storage_account.id

  rule {
    name    = "rule1"
    enabled = true
    filters {
      prefix_match = ["${azurerm_storage_container.storage_container.name}/${var.storage_container_prefix}"]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.cool_after_days
        tier_to_archive_after_days_since_modification_greater_than = var.archive_after_days
        delete_after_days_since_modification_greater_than          = var.delete_after_days
      }
      # snapshot {
      #   delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days
      # }
    }
  }
}
