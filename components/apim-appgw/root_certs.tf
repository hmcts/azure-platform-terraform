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

data "azurerm_key_vault_secret" "reform-scan-sscs-ca" {
  name         = "reform-scan-sscs-ca"
  key_vault_id = data.azurerm_key_vault.key_vault.id

  provider = azurerm.kv
}

data "azurerm_key_vault_secret" "dts-bsp-team-ca" {
  name         = "dts-bsp-team-ca"
  key_vault_id = data.azurerm_key_vault.key_vault.id

  provider = azurerm.kv
}

data "azurerm_key_vault_secret" "exela-uat-ca" {
  name         = "exela-uat-ca"
  key_vault_id = data.azurerm_key_vault.key_vault.id

  provider = azurerm.kv
}

data "azurerm_key_vault_secret" "iron-mountain-ca" {
  name         = "iron-mountain-ca"
  key_vault_id = data.azurerm_key_vault.key_vault.id

  provider = azurerm.kv
}