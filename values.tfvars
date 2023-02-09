create_resource_group = "true"
resource_group_name = "tf-gh-prodeng"
storage_region_name = "westus"
storage_account_name = "tfghblobstore"
storage_account_type = "BlobStorage"
storage_account_replication_type = "LRS"
storage_access_tier = "Hot"
storage_account_tier = "Standard"
storage_min_tls_version = "TLS1_2"
blob_soft_delete_retention_days = "2"
container_soft_delete_retention_days = "2"
blob_enable_versioning = "false"
last_access_time_enabled = "false"
change_feed_enabled = "false"
enable_advanced_threat_protection = "false"
cool_after_days = "3"
archive_after_days = "5"
delete_after_days = "7"
storage_network_ips = "216.147.113.1"
storage_container_name = "container1"
storage_container_prefix = "full-"
storage_tags = {
  "name" = "tf-gh-sample"
  "environment" = "test"
  "created_by" = "terraform"
}
