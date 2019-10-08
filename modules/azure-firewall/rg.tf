resource "azurerm_resource_group" "main" {
  count    = length(var.firewall)
  name     = "hub-${var.env}-${lookup(element(var.firewall, count.index), "location")}-rg"
  location = lookup(element(var.firewall, count.index), "location")

  tags = var.common_tags
}