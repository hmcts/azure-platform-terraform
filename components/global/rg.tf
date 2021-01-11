data "azurerm_resource_group" "main" {
  name = "lz-${var.env}-rg"
}

data "azurerm_resource_group" "key_vault" {
  name = var.env == "perftest" || var.env == "aat" || var.env == "preview" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}
