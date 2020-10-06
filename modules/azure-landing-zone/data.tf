# KeyVault for the certificate must be in the same subscription as Frontdoor.
data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = var.env == "perftest" || var.env == "aat" || var.env == "preview" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}

data "azurerm_key_vault_secret" "certificate" {
  for_each = { for frontend in var.frontends :
    frontend.name => frontend
  }
  name         = lookup(each.value, "certificate_name")
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}

data "azurerm_client_config" "current" {}
