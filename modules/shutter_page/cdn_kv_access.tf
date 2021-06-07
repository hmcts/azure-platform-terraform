data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = "cft-platform-${var.subscription}-rg"
}
