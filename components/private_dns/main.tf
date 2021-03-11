data "local_file" "configuration" {
  filename = var.yaml_path
}

module "azure-private-dns" {
  source = "git::https://github.com/hmcts/azure-private-dns.git?ref=master"

  providers = {
    azurerm      = "azurerm"
    azurerm.data = "azurerm.data"
  }

  yaml_path                  = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env                        = var.env
  location                   = var.location
  private_ip_address         = var.app_gw_private_ip_address
  backend_pool_ip_addresses  = var.cft_apps_cluster_ips
  vault_name                 = var.certificate_key_vault_name
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  common_tags                = local.common_tags
  log_analytics_workspace_id = module.logworkspace.workspace_id
  key_vault_resource_group   = local.key_vault_resource_group


  name                = lower(each.value.name)
  zone_name           = azurerm_private_dns_zone.zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.record

}