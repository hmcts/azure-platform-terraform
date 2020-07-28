resource "azurerm_storage_container" "containers" {
  count                 = length(var.shutter_apps)
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.shutter_store[count.index].name
  container_access_type = "private"
}
