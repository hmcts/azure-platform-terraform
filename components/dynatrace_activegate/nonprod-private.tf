# For private ActiveGate synthethic monitoring
module "nonprod_dynatrace_activegate_private" {

  providers = {
    azurerm               = azurerm
    azurerm.hmcts-control = azurerm.log_analytics_nonprod
  }

  source                  = "../../modules/dynatrace-activegate"
  instance_count          = 2
  dynatrace_instance_name = "yrk32651"
  env                     = "nonprod"
  network_zone            = "azure.cft"
  config_file_name        = "cloudconfig-private"
  enable_log_analytics    = true

  common_tags = module.ctags.common_tags
}