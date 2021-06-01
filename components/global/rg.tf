locals {
  potential_kv_rg = var.env == "perftest" || var.env == "aat" || var.env == "preview" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
  key_vault_resource_group = var.env == "sbox" ? "cft-platform-${var.env}-rg" : local.potential_kv_rg
}

data "azurerm_resource_group" "main" {
  name = "lz-${var.env}-rg"
}

data "azurerm_resource_group" "key_vault" {
  name = local.key_vault_resource_group
}
