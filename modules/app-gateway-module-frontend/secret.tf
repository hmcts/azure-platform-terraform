data "azurerm_key_vault" "main" {
  count = length(var.frontends) != 0 ? 1 : 0

  name                = var.vault_name
  resource_group_name = "core-infra-${var.subscription}-rg"
}

resource "azurerm_key_vault_secret" "internal-fe-lb-ip" {
  count = length(var.frontends) != 0 ? 1 : 0

  name         = "internal-fe-lb-ip"
  value        = var.private_ip_address
  key_vault_id = data.azurerm_key_vault.main[0].id
}