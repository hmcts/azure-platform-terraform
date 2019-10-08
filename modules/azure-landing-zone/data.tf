# KeyVault for the certificate must be in the same subscription as Frontdoor.
data "azurerm_key_vault" "certificate_vault" {
  name                = "cftapps-${var.env}"
  resource_group_name = "core-infra-${var.env}-rg"
}

data "azurerm_key_vault_secret" "certificate" {
  count        = length(var.frontends)
  name         = lookup(element(var.frontends, count.index), "certificate_name")
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}
