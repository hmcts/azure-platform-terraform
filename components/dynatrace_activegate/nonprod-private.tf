# For private ActiveGate synthethic monitoring
module "nonprod_dynatrace_activegate_private" {
  source                  = "../../modules/dynatrace-activegate"
  instance_count          = 2
  dynatrace_instance_name = "yrk32651"
  env                     = "nonprod"
  network_zone            = "azure.cft"
  config_file_name        = "cloudconfig-private"

  common_tags = module.ctags.common_tags
}