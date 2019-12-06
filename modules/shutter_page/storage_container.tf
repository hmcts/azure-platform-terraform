resource "azurerm_storage_container" "containers" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.shutter_store.name
  container_access_type = "private"
}

resource "null_resource" "static_website_cmd" {
  provisioner "local-exec" {
    command = <<EOF
az storage blob service-properties update \
  --subscription "${data.azurerm_subscription.current.subscription_id}" \
  --account-name "${azurerm_storage_account.shutter_store.name}" \
  --static-website \
  --404-document index.html \
  --index-document index.html
EOF
  }
  depends_on = [azurerm_storage_container.containers]
}