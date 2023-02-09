#============================================================
# https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal
#============================================================
variable "create_resource_group" {
  description = "Create resource group and use it for all networking resources or not?"
  default     = false
  type        = bool
}

variable "resource_group_name" {
  description = "Resource group used by storage"
  default     = "tf-gh-resourcegroupname"
  type        = string
}

#============================================================
# https://azure.microsoft.com/en-us/explore/global-infrastructure/geographies/#overview
#============================================================
variable "storage_region_name" {
  description = "The region to keep all your resources."
  default     = "westus"
  type        = string
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview
#============================================================
variable "storage_account_name" {
  description = "The name of the azure storage account"
  default     = "tf-gh-storageaccountname"
  type        = string
}

variable "storage_account_type" {
  description = "Select from: BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  default     = "BlobStorage"
  type        = string
}

variable "storage_account_replication_type" {
  description = "Select from: LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  default     = "LRS"
  type        = string
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview
#============================================================
variable "storage_access_tier" {
  description = "Select either access tier: Hot, Cool, Archive"
  default     = "Hot"
  type        = string
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview
#============================================================
variable "storage_account_tier" {
  description = "Select from: Standard, Premium"
  default     = "Standard" #Premium required for BlockBlobStorage & FileStorage
  type        = string
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/common/transport-layer-security-configure-minimum-version?tabs=portal
#============================================================
variable "storage_min_tls_version" {
  description = "Minimum supported TLS version allowed"
  default     = "TLS1_2"
  type        = string
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/soft-delete-blob-overview
#============================================================
variable "blob_soft_delete_retention_days" {
  description = "Select between 1 and 365 days"
  default     = 7
  type        = number
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/soft-delete-container-overview
#============================================================
variable "container_soft_delete_retention_days" {
  description = "Select between 1 and 365 days"
  default     = 7
  type        = number
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/versioning-overview
#============================================================
variable "blob_enable_versioning" {
  description = "Enable blob versioning or not?"
  default     = false
  type        = bool
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview?tabs=azure-portal#move-data-based-on-last-accessed-date-preview
#============================================================
variable "last_access_time_enabled" {
  description = "Enable lifecycle last access time or not?"
  default     = false
  type        = bool
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-change-feed?tabs=azure-portal
#============================================================
variable "change_feed_enabled" {
  description = "Enable transaction logs of all blob related changes or not?"
  default     = false
  type        = bool
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/common/azure-defender-storage-configure?tabs=per-storage-account
#============================================================
variable "enable_advanced_threat_protection" {
  description = "Enable advanced threat protection or not?"
  default     = false
  type        = bool
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security?tabs=azure-portal
#============================================================
variable "storage_network_ips" {
  description = "Restrict access to the this IP list or CIDR."
  type        = string
  default     = null
}

variable "storage_container_name" {
  description = "Container name to create."
  type        = string
  default     = null
}

variable "storage_container_prefix" {
  description = "Container prefix to maintain via lifecycle policy."
  type        = string
  default     = null
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview
#============================================================
variable "cool_after_days" {
  description = "Days to cool blobs after"
  type = number
  default = 3
}

variable "archive_after_days" {
  description = "Days to archive blobs after"
  type = number
  default = 5
}

variable "delete_after_days" {
  description = "Days to delete blobs after"
  type = number
  default = 7
}

#============================================================
# https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-index-how-to?tabs=azure-portal
#============================================================
variable "storage_tags" {
  description = "A tag to lookup all related storage resources"
  type        = map
  default     = {}
}
