resource "azurerm_cdn_profile" "main" {
  name                = "hmcts-shutter-${var.env}"
  location            = "West US"
  resource_group_name = data.azurerm_resource_group.shutter.name
  sku                 = var.cdn_sku

  tags = var.common_tags
}