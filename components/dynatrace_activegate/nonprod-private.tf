# For private ActiveGate synthethic monitoring
# module "nonprod_dynatrace_activegate_private" {

#   providers = {
#     azurerm     = azurerm
#     azurerm.law = azurerm.law_nonprod
#     azurerm.soc = azurerm.soc
#   }

#   source                  = "../../modules/dynatrace-activegate"
#   instance_count          = 2
#   dynatrace_instance_name = "yrk32651"
#   env                     = "nonprod"
#   network_zone            = "azure.cft"
#   config_file_name        = "cloudconfig-private"
#   enable_log_analytics    = true
#   install_splunk_uf       = true

#   common_tags = module.ctags.common_tags
# }