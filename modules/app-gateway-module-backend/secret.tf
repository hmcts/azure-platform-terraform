data "azurerm_key_vault" "main" {
  name                = var.vault_name
  resource_group_name = "core-infra-${var.subscription}-rg"
}

resource "azurerm_key_vault_secret" "test" {
  count        = length(var.private_ip_address)
  name         = element(var.private_ip_address, count.index) == var.private_ip_address[0] ? "internal-lb-ip" : "internal-lb-ip-${count.index}"
  value        = var.private_ip_addresses
  key_vault_id = data.azurerm_key_vault.main.id

  tags = local.tags
}