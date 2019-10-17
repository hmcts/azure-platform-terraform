data "azurerm_resource_group" "lz-fw" {
  count = length(var.firewall)
  name  = "${var.component}-${var.env}-${lookup(element(var.firewall, count.index), "location")}-rg"
}