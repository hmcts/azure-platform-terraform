resource "azurerm_cdn_endpoint" "shutter_endpoint" {
  count                  = length(var.shutter_apps)
  name                   = "hmcts-${split(".", replace(var.shutter_apps[count.index], "www.", ""))[0]}-shutter"
  profile_name           = azurerm_cdn_profile.main.name
  location               = "West US"
  resource_group_name    = data.azurerm_resource_group.shutter.name
  is_http_allowed        = "false"
  is_compression_enabled = "false"

  origin {
    name      = replace(azurerm_storage_account.shutter_store.primary_web_host, ".", "-")
    host_name = azurerm_storage_account.shutter_store.primary_web_host
  }

  origin_host_header = azurerm_storage_account.shutter_store.primary_web_host

  tags = var.common_tags
}