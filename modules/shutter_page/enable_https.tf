data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "certificate" {
  count        = lookup(var.shutter_apps, "enable_shutter", true) ? length(var.shutter_apps) : 0
  name         = lookup(var.shutter_apps[count.index], "certificate_name")
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}

resource "null_resource" "enable_custom_https_cmd" {
  count = lookup(var.shutter_apps, "enable_shutter", true) ? length(var.shutter_apps) : 0

  provisioner "local-exec" {
    command = <<EOF

json='
${templatefile("${path.module}/templates/customHttps.json", {
    secret_name : data.azurerm_key_vault_secret.certificate[count.index].name,
    secret_version : data.azurerm_key_vault_secret.certificate[count.index].version,
    resource_group : data.azurerm_resource_group.shutter.name,
    subscription_id : data.azurerm_client_config.current.subscription_id,
    vault_name : var.certificate_key_vault_name
})}'


az rest --method POST \
 --uri "https://management.azure.com/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.shutter.name}/providers/Microsoft.Cdn/profiles/${var.cdn_profile}/endpoints/${azurerm_cdn_endpoint.shutter_endpoint[count.index].name}/customDomains/${replace(var.shutter_apps[count.index].custom_domain, ".", "-")}/enableCustomHttps?api-version=2019-04-15" \
 --body "$json" || true # this can only be run if it's not been run before or its in the completed state.
EOF
}

depends_on = [azurerm_template_deployment.custom_domain, azurerm_key_vault_access_policy.cdn]
}