resource "azurerm_cdn_profile" "main" {
  name                = "hmcts-shutter-${var.env}"
  location            = "West US"
  resource_group_name = var.resource_group_name
  sku                 = var.cdn_sku

  tags = local.common_tags
}