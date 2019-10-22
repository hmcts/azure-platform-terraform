# KeyVault for the certificate must be in the same subscription as Frontdoor.
data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = var.env == "perftest" || var.env == "aat"? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}

data "azurerm_key_vault_secret" "certificate" {
  count        = length(var.frontends)
  name         = lookup(var.frontends[count.index], "certificate_name")
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}

data "azurerm_client_config" "current" {}
