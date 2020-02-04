resource "azurerm_storage_container" "containers" {
  count                 = length(var.shutter_apps)
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.shutter_store[count.index].name
  container_access_type = "private"
}

resource "null_resource" "static_website_cmd" {
  count = length(var.shutter_apps)
  provisioner "local-exec" {
    command = <<EOF
az storage blob service-properties update \
  --subscription "${data.azurerm_subscription.current.subscription_id}" \
  --account-name "${azurerm_storage_account.shutter_store[count.index].name}" \
  --static-website \
  --404-document index.html \
  --index-document index.html
EOF
  }
  depends_on = [azurerm_storage_container.containers]
}