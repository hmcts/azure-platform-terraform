data "azurerm_virtual_network" "aks" {
  count               = "${length(var.aks)}"
  name                = "${lookup(var.aks[count.index], "vnet_name")}"
  resource_group_name = "${lookup(var.aks[count.index], "rg_name")}"
}

resource "azurerm_virtual_network_peering" "hub_to_aks" {
  count                        = "${length(var.vnet_cidr)}"
  name                         = "hub_to_aks"
  resource_group_name          = "${azurerm_resource_group.main[count.index].name}"
  virtual_network_name         = "${azurerm_virtual_network.main[count.index].name}"
  remote_virtual_network_id    = "${data.azurerm_virtual_network.aks[count.index].id}"
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "aks_to_hub" {
  count                        = "${length(var.aks)}"
  name                         = "aks_to_hub"
  resource_group_name          = "${data.azurerm_virtual_network.aks[count.index].resource_group_name}"
  virtual_network_name         = "${data.azurerm_virtual_network.aks[count.index].name}"
  remote_virtual_network_id    = "${azurerm_virtual_network.main[count.index].id}"
  allow_virtual_network_access = true
}
