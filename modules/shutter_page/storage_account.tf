resource "azurerm_storage_account" "shutter_store" {
  count                     = length(var.shutter_apps)
  name                      = lookup(var.shutter_apps[count.index], "shutter", "") == "custom" ? "hmcts${substr(replace(lookup(var.shutter_apps[count.index], "name"), "-", ""), 0, 8)}shutter${var.env}" : "hmctsdefaultshutter${var.env}"
  resource_group_name       = data.azurerm_resource_group.shutter.name
  location                  = data.azurerm_resource_group.shutter.location
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  account_kind              = "StorageV2"
  enable_https_traffic_only = true

  tags = var.common_tags
}