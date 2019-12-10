resource "null_resource" "enable_custom_https_cmd" {
  count = length(var.shutter_apps)

  provisioner "local-exec" {
    command = <<EOF
az cdn custom-domain enable-https \
  --endpoint-name "${azurerm_cdn_endpoint.shutter_endpoint[count.index].name}" \
  --profile-name "${azurerm_cdn_profile.main.name}" \
  --resource-group "${data.azurerm_resource_group.shutter.name}" \
  --name "${replace(var.shutter_apps[count.index], ".", "-")}"
EOF
  }
  depends_on = [azurerm_template_deployment.custom_domain]
}