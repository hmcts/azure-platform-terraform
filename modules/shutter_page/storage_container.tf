resource "azurerm_storage_container" "containers" {
  count                 = lookup(var.shutter_apps, "enable_shutter", true) ? length(var.shutter_apps) : 0
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.shutter_store[count.index].name
  container_access_type = "private"
}
