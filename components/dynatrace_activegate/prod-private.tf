# For private ActiveGate synthethic monitoring
module "dynatrace_activegate" {
  source           = "../../modules/dynatrace-activegate"
  instance_count   = 2
  network_zone     = "azure.cft"
  config_file_name = "cloudconfig-private"

  common_tags = module.ctags.common_tags
}