# access github api key from key vault
data "azurerm_key_vault" "kv" {
  provider            = azurerm.githubkey
  name                = "cftptl-intsvc"
  resource_group_name = "core-infra-intsvc-rg"
}

data "azurerm_key_vault_secret" "githubapi" {
  provider     = azurerm.githubkey
  name         = "github-management-api-token"
  key_vault_id = data.azurerm_key_vault.kv.id
}