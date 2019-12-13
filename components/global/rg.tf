data "azurerm_resource_group" "main" {
  name = "lz-${var.env}-rg"
}