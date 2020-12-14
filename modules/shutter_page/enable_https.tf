data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "certificate" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name         = "${each.value.certificate_name}"
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}

resource "null_resource" "enable_custom_https_cmd" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  provisioner "local-exec" {
    command = <<EOF

json='
${templatefile("${path.module}/templates/customHttps.json", {
    secret_name : data.azurerm_key_vault_secret.certificate["${each.value.name}"].name,
    secret_version : data.azurerm_key_vault_secret.certificate["${each.value.name}"].version,
    resource_group : data.azurerm_resource_group.shutter.name,
    subscription_id : data.azurerm_client_config.current.subscription_id,
    vault_name : var.certificate_key_vault_name
})}'


az rest --method POST \
 --uri "https://management.azure.com/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.shutter.name}/providers/Microsoft.Cdn/profiles/${azurerm_cdn_profile.main["${each.value.team}"].name}/endpoints/${azurerm_cdn_endpoint.shutter_endpoint["${each.value.name}"].name}/customDomains/${replace("${each.value.custom_domain}", ".", "-")}/enableCustomHttps?api-version=2019-04-15" \
 --body "$json" || true # this can only be run if it's not been run before or its in the completed state.
EOF
}

depends_on = [azurerm_template_deployment.custom_domain, azurerm_key_vault_access_policy.cdn]
}