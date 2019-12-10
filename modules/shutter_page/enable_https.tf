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

# curl -X POST \
# "https://management.azure.com/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourcegroups/${data.azurerm_resource_group.shutter.name}/providers/Microsoft.Cdn/profiles/${azurerm_cdn_profile.main.name}/endpoints/${azurerm_cdn_endpoint.shutter_endpoint[count.index].name}/customdomains/${replace(var.shutter_apps[count.index], ".", "-")}/enableCustomHttps?api-version=2017-10-12" \
# -H "Accept: */*" \
# -H "Host: management.azure.com" \
# -H "Accept-Encoding: gzip, deflate" \
# -H "Authorization: Bearer $azureApiToken" \
# -H "Cache-Control: no-cache" \
# -H "Connection: keep-alive" \
# -H "Content-Type: application/json" \
# -H "cache-control: no-cache" \
# -d "{
# 	'certificateSource': 'AzureKeyVault',
# 	'protocolType': 'ServerNameIndication',
# 	'certificateSourceParameters': {
# 		'@odata.type': '#Microsoft.Azure.Cdn.Models.KeyVaultCertificateSourceParameters',
# 		'subscriptionId': '$subscriptionId',
# 		'resourceGroupName': '$resourceGroupName',
# 		'vaultName': '$vaultName',
# 		'secretName': '$secretName',
# 		'secretVersion': '$secretVersion',
# 		'updateRule': 'NoAction',
# 		'deleteRule': 'NoAction'
# 	},
# }";