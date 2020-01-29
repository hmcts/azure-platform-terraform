resource "azurerm_cdn_endpoint" "shutter_endpoint" {
  count                  = length(var.frontends)
  name                   = "hmcts-${split(".", replace(var.frontends[count.index].custom_domain, "www.", ""))[0]}-shutter-${var.env}"
  profile_name           = var.cdn_profile
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