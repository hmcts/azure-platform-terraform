resource "azurerm_storage_account" "shutter_store" {
  count                     = lookup(var.shutter_apps, "enable_shutter", true) ? length(var.shutter_apps) : 0
  name                      = "hmcts${substr(replace(lookup(var.shutter_apps[count.index], "name"), "-", ""), 0, 8)}shutter${var.env}"
  resource_group_name       = data.azurerm_resource_group.shutter.name
  location                  = data.azurerm_resource_group.shutter.location
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  account_kind              = "StorageV2"
  enable_https_traffic_only = true

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }

  tags = var.common_tags
}