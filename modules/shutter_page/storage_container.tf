resource "azurerm_storage_container" "containers" {
  count                  = length(var.shutter_app_name)
  name                  = var.shutter_app_name[count.index]
  storage_account_name  = azurerm_storage_account.shutter_store.name
  container_access_type = "container"
}