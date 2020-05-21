resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = var.common_tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_cosmosdb_account" "main" {
  name                              = var.cosmos_account_name
  location                          = azurerm_resource_group.main.location
  resource_group_name               = azurerm_resource_group.main.name
  offer_type                        = var.offer_type
  kind                              = var.kind
  is_virtual_network_filter_enabled = true

  tags = var.common_tags

  consistency_policy {
    consistency_level = var.consistency_level
  }

  geo_location {
    location          = azurerm_resource_group.main.location
    failover_priority = 0
  }

  dynamic "virtual_network_rule" {
    iterator = vnetrule
    for_each = var.subnet_ids

    content {
      id = vnetrule.value
    }
  }

}

