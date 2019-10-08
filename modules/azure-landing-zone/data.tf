# KeyVault for the certificate should be in the same subscription as Frontdoor.
data "azurerm_key_vault" "certificate_vault" {
  name                = var.keyVault_name
  resource_group_name = var.keyVault_rg
}

data "azurerm_key_vault_secret" "certificate" {
  count        = length(var.frontends)
  name         = "STAR-${replace(lookup(element(var.frontends, count.index), "custom_domain"), ".", "-")}"
  key_vault_id = "${data.azurerm_key_vault.certificate_vault.id}"
}
