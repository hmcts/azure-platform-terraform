locals {
  isddosstandard = "${length(var.firewall) != 0 && var.ddosplan != "basic" ? [1] : []}"
}

resource "azurerm_network_ddos_protection_plan" "main" {
  count               = "${length(var.firewall) != 0 && var.ddosplan != "basic" ? length(var.firewall) : 0}"
  name                = "ddospplan-${lookup(element(var.firewall, count.index), "location")}"
  location            = data.azurerm_resource_group.lz-fw[count.index].location
  resource_group_name = data.azurerm_resource_group.lz-fw[count.index].name
}

resource "azurerm_virtual_network" "main" {
  count               = length(var.firewall)
  name                = "hub-${var.env}-vnet"
  location            = data.azurerm_resource_group.lz-fw[count.index].location
  resource_group_name = data.azurerm_resource_group.lz-fw[count.index].name
  address_space       = ["${lookup(element(var.firewall, count.index), "hub_vnet")}"]

  dynamic "ddos_protection_plan" {
    for_each = local.isddosstandard 

    content {
      id     = "${azurerm_network_ddos_protection_plan.main[count.index].id}"
      enable = true
    }
  }

  tags = var.common_tags
}