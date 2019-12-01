resource "azurerm_cdn_profile" "main" {
  name                = "hmcts-shutter-page-${var.shutter_env}"
  location            = "West US"
  resource_group_name = data.azurerm_resource_group.shutter.name
  sku                 = "Premium_Verizon"

  # tags = var.common_tags
}