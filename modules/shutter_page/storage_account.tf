resource "azurerm_storage_account" "shutter_store" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name                            = "hmcts${substr(replace(("${each.value.name}"), "-", ""), 0, 8)}shutter${var.env}"
  resource_group_name             = data.azurerm_resource_group.shutter.name
  location                        = data.azurerm_resource_group.shutter.location
  account_tier                    = "Standard"
  account_replication_type        = "RAGRS"
  account_kind                    = "StorageV2"
  enable_https_traffic_only       = true
  allow_nested_items_to_be_public = false

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }

  tags = var.common_tags
}