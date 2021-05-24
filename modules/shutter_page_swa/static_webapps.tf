data "azurerm_resource_group" "shutter" {
  name = var.resource_group_name
}

resource "azurerm_static_site" "static_webapp" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend if !contains([
    "jui-redirect",
    "fact-redirect"], frontend.name)
  }

  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.shutter.name
  location            = "westeurope" // not supported in uksouth yet
}
