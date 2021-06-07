locals {
  key_vault_resource_group = "cft-platform-${var.subscription}-rg"
}

data "azurerm_resource_group" "main" {
  name = "lz-${var.env}-rg"
}

data "azurerm_resource_group" "key_vault" {
  name = local.key_vault_resource_group
}
