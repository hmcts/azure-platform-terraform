data "azurerm_resource_group" "main" {
  name = "${var.component}-${var.env}-rg"
}