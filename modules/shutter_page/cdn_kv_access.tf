data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = var.env == "sbox" ? "cft-platform-${var.env}-rg" : var.env == "perftest" || var.env == "aat" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}

resource "azurerm_key_vault_access_policy" "cdn" {
  
  #sbox is now rbac permissions
  count               = var.env == "prod" ? 1 : 0 
  key_vault_id = data.azurerm_key_vault.certificate_vault.id

  object_id = "b9e9cc17-753c-47c6-817f-c0c9f2a47d2b"
  tenant_id = data.azurerm_client_config.current.tenant_id

  secret_permissions      = ["get", "list"]
  certificate_permissions = ["get", "list"]
  key_permissions         = ["get", "list"]
}
