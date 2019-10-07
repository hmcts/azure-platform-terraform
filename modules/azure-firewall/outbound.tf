data "azurerm_route_table" "default" {
  count               = "${length(var.aks)}"
  name                = "${lookup(var.aks[count.index], "rt_name")}"
  resource_group_name = "${lookup(var.aks[count.index], "rg_name")}"
}

resource "azurerm_route" "default" {
  count                  = length(var.firewall)
  name                   = "defaultOutbound"
  resource_group_name    = lookup(var.aks[count.index], "rg_name")
  route_table_name       = data.azurerm_route_table.default[count.index].name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = lookup(azurerm_firewall.main[count.index].ip_configuration[count.index], "private_ip_address")
}