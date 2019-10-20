data "azurerm_public_ip" "pip" {
  count               = length(var.firewall)
  name                = azurerm_public_ip.main[count.index].name
  resource_group_name = azurerm_public_ip.main[count.index].resource_group_name
}

resource "azurerm_firewall_nat_rule_collection" "main" {
  count               = length(var.firewall)
  name                = "dnat-${lookup(var.common_tags, "activityName")}"
  azure_firewall_name = azurerm_firewall.main[count.index].name
  resource_group_name = data.azurerm_resource_group.lz-fw[count.index].name
  priority            = lookup(element(var.firewall, count.index), "priority")
  action              = "Dnat"

  dynamic "rule" {
    iterator = rules
    for_each = lookup(element(var.firewall, count.index), "aks_dnat_rules")

    content {
      name = "${lookup(var.common_tags, "activityName")}-${rules.value}"

      source_addresses = [
        "*",
      ]

      destination_ports = [
        "80",
      ]

      destination_addresses = [
        data.azurerm_public_ip.pip[count.index].ip_address
      ]

      protocols = [
        "TCP"
      ]

      translated_address = rules.value
      translated_port    = "80"

    }
  }
}