resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "${var.product}-shutter-webapp-${var.env}-rg"
}
