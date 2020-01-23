data "azurerm_client_config" "current" {}

resource "null_resource" "enable_custom_https_cmd" {
  count = length(var.frontends)

  provisioner "local-exec" {
    command = <<EOF

json='
${templatefile("${path.module}/templates/customHttps.json", {
    secret_name : var.frontends[count.index].certificate_name,
    resource_group : data.azurerm_resource_group.shutter.name,
    subscription_id : data.azurerm_client_config.current.subscription_id,
    vault_name : var.certificate_key_vault_name
})}'


az rest --method POST \
 --uri "https://management.azure.com/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.shutter.name}/providers/Microsoft.Cdn/profiles/${azurerm_cdn_profile.main.name}/endpoints/${azurerm_cdn_endpoint.shutter_endpoint[count.index].name}/customDomains/${replace(var.frontends[count.index].custom_domain, ".", "-")}/enableCustomHttps?api-version=2019-04-15" \
 --body "$json" || true # this can only be run if it's not been run before or its in the completed state.
EOF
}

depends_on = [azurerm_template_deployment.custom_domain]
}