data "azurerm_resource_group" "shutter" {
  name = var.resource_group_name
}

resource "azurerm_static_site" "static_webapp" {
  for_each = {
  // TODO add jui and fact redirect in prod to ignore list, not done now to avoid conflicts
    for frontend in var.shutter_apps : frontend.name => frontend if !lookup(frontend, "disable_shutter", false)
  }

  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.shutter.name
  location            = "westeurope" // not supported in uksouth yet
  tags                = var.common_tags // supported but doesn't work with update, re-create existing resources later
}

resource "azurerm_static_site_custom_domain" "custom_domain" {
  for_each = {
    for frontend in var.shutter_apps : frontend.name => frontend if !lookup(frontend, "disable_shutter", false)
  }

  static_site_id  = azurerm_static_site.static_webapp[each.value.name].id
  name            = each.value.custom_domain
  validation_type = "dns-txt-token"
}

output "validation_tokens" {
  value = tomap({
    for k, bd in azurerm_static_site_custom_domain.custom_domain : k => nonsensitive(bd.validation_token)
  })
}

