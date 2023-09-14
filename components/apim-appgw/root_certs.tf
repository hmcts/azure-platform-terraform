data "azurerm_key_vault" "key_vault" {
  name                = local.key_vault_name
  resource_group_name = local.key_vault_resource_group

  provider = azurerm.kv
}

data "azurerm_key_vault_secret" "civil-sdt-root-ca" {
  name         = "civil-sdt-root-ca"
  key_vault_id = data.azurerm_key_vault.key_vault.id

  provider = azurerm.kv
}