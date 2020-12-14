resource "azurerm_cdn_profile" "main" {
  for_each = toset(distinct([for frontend in var.shutter_apps : frontend.product]))

  name                = "hmcts-shutter-${each.value}"
  location            = "West US"
  resource_group_name = var.shutter_rg
  sku                 = var.cdn_sku

  tags = var.common_tags
}