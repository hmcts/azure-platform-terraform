data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = "cft-platform-${var.subscription}-rg"
}

resource "azurerm_role_assignment" "cdn" {
  role_definition_name = "Key Vault Secrets User"
  principal_id         = "b9e9cc17-753c-47c6-817f-c0c9f2a47d2b"
  scope                = data.azurerm_key_vault.certificate_vault.id
}
