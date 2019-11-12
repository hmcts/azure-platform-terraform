resource "azurerm_key_vault_access_policy" "frontdoor_kv_access" {
  key_vault_id = data.azurerm_key_vault.certificate_vault.id

  object_id = "0a7e9367-4349-4b24-974a-bfa7b23a38fc"
  tenant_id = data.azurerm_client_config.current.tenant_id

  secret_permissions      = ["get", "list"]
  certificate_permissions = ["get", "list"]
  key_permissions         = ["get", "list"]
}
