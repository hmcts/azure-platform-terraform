module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

}

data "azurerm_subscription" "current" {}

locals {
  key_vault_name = "acmedcdcftapps${var.subscription}"
  dns_zone       = (var.env == "sbox") ? "sandbox" : var.env
}

module "app-gw" {

  providers = {
    azurerm     = azurerm
    azurerm.hub = azurerm.hub
    azurerm.kv  = azurerm.kv
  }

  source                                       = "git::https://github.com/hmcts/terraform-module-apim-application-gateway.git?ref=main"
  yaml_path                                    = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
  env                                          = local.dns_zone
  location                                     = var.location
  private_ip_address                           = var.hub_app_gw_private_ip_address
  backend_pool_ip_addresses                    = var.apim_appgw_backend_pool_ips
  backend_pool_fqdns                           = var.apim_appgw_backend_pool_fqdns
  vault_name                                   = local.key_vault_name
  vnet_rg                                      = local.vnet_rg
  vnet_name                                    = local.vnet_name
  common_tags                                  = module.ctags.common_tags
  log_analytics_workspace_id                   = module.logworkspace.workspace_id
  key_vault_resource_group                     = local.key_vault_resource_group
  subnet_name                                  = local.subnet_name
  waf_mode                                     = var.waf_mode
  exclusions                                   = var.apim_appgw_exclusions
  public_ip_enable_multiple_availability_zones = true
  enable_multiple_availability_zones           = var.env == "sbox" ? false : true
  min_capacity                                 = var.apim_appgw_min_capacity
  max_capacity                                 = var.apim_appgw_max_capacity
  ssl_policy                                   = var.ssl_policy

  trusted_client_certificate_data = merge(
    {
      for cert_name in local.cert_names :
      cert_name => {
        path = data.azurerm_key_vault_secret.secrets[cert_name].value
      }
    },
    {
      "lets_encrypt" = {
        path = file("${path.module}/merged.pem")
      }
    }
  )

  depends_on = [data.external.bash_script]
}

data "external" "bash_script" {
  program = ["bash", "${path.module}/download_root_certs.bash"]
}
