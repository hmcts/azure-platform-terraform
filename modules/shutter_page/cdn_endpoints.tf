resource "azurerm_cdn_endpoint" "shutter_endpoint" {
  count                  = length(var.shutter_app_name)
  # name                   = "hmtcs-${var.shutter_app_name[count.index]}-shutter"
  #  below name is to test the current configuration
  name                   = "hmcts-shutter-apps-sbox"  
  profile_name           = azurerm_cdn_profile.main.name
  location               = "West US"
  resource_group_name    = data.azurerm_resource_group.shutter.name
  is_http_allowed        = "false"
  is_compression_enabled = "false"

  origin {
    name      = replace(azurerm_storage_account.shutter_store.primary_blob_host, ".", "-")
    host_name = azurerm_storage_account.shutter_store.primary_blob_host
  }

  origin_host_header = azurerm_storage_account.shutter_store.primary_blob_host
  origin_path        = "/${var.shutter_app_name[count.index]}"
  
  # https://github.com/terraform-providers/terraform-provider-azurerm/issues/1109
  querystring_caching_behaviour = "NotSet"

  # tags = var.common_tags
}
