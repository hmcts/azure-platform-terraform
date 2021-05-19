data "azurerm_resource_group" "shutter" {
  name = var.resource_group_name
}

data "azurerm_subscription" "current" {}