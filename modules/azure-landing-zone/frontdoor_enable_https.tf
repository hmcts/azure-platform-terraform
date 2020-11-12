resource "azurerm_frontdoor_custom_https_configuration" "enable-https" {
  for_each = {
    for frontend in var.frontends : frontend.name => frontend
  }
  frontend_endpoint_id              = "/subscriptions/${var.subscription_id}/resourcegroups/${azurerm_frontdoor.main.resource_group_name}/providers/Microsoft.Network/frontdoors/${azurerm_frontdoor.main.name}/frontendendpoints/${each.value["name"]}"
  resource_group_name               = azurerm_frontdoor.main.resource_group_name
  custom_https_provisioning_enabled = lookup(each.value, "enable_ssl", true)
  dynamic "custom_https_configuration" {
    for_each = lookup(each.value, "enable_ssl", true) ? [1] : []
    content {
      certificate_source                         = var.ssl_mode
      azure_key_vault_certificate_vault_id       = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault.certificate_vault.id : null
      azure_key_vault_certificate_secret_name    = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault_secret.certificate[each.value["name"]].name : null
      azure_key_vault_certificate_secret_version = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault_secret.certificate[each.value["name"]].version : null
    }
  }
}