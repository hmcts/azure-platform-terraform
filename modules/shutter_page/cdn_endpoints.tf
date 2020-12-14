resource "azurerm_cdn_endpoint" "shutter_endpoint" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }
  name                   = "hmcts-${split(".", replace("${each.value.custom_domain}", "www.", ""))[0]}-shutter-${var.env}"
  profile_name           = azurerm_cdn_profile.main["${each.value.product}"].name
  location               = "West US"
  resource_group_name    = data.azurerm_resource_group.shutter.name
  is_http_allowed        = "false"
  is_compression_enabled = "false"

  origin {
    name      = replace(azurerm_storage_account.shutter_store["${each.value.name}"].primary_web_host, ".", "-")
    host_name = azurerm_storage_account.shutter_store["${each.value.name}"].primary_web_host
  }

  origin_host_header = azurerm_storage_account.shutter_store["${each.value.name}"].primary_web_host

  tags = var.common_tags

  depends_on = [azurerm_cdn_profile.main]
}