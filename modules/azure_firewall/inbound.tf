data "azurerm_public_ip" "pip" {
  count               = "${length(var.firewall_location)}"
  name                = "${azurerm_public_ip.main[count.index].name}"
  resource_group_name = "${azurerm_public_ip.main[count.index].resource_group_name}"
}

resource "azurerm_firewall_nat_rule_collection" "main" {
  count               = length(var.dnat_rules)
  name                = "dnatRule-${lookup(element(var.dnat_rules, count.index), "location")}"
  azure_firewall_name = azurerm_firewall.main[count.index].name
  resource_group_name = azurerm_resource_group.main[count.index].name
  priority            = 200
  action              = "Dnat"

  dynamic "rule" {
    iterator = rules
    for_each = lookup(element(var.dnat_rules, count.index), "aks_lb")

    content {
      name = "rule-${rules.value}"

      source_addresses = [
        "147.243.0.0/16",
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
      translated_port = "80"

    }
  }
}