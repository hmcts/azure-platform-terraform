resource "azurerm_storage_account" "shutter_store" {
  name                      = "hmcts${var.shutter_storage}shutter${var.env}"
  resource_group_name       = data.azurerm_resource_group.shutter.name
  location                  = data.azurerm_resource_group.shutter.location
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  account_kind              = "StorageV2"
  enable_https_traffic_only = true

  tags = var.common_tags
}