module "nonprodukwest_dynatrace_activegate" {
  source                  = "../../modules/dynatrace-activegate"
  instance_count          = 2
  dynatrace_instance_name = "yrk32651"
  env                     = "nonprod-ukwest"
  network_zone            = "azure.cft"
  location                = "UK West"

  common_tags = local.common_tags
}