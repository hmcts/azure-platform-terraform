module "nonprod_ukwest_dynatrace_activegate" {
  source                  = "../../modules/dynatrace-activegate"
  instance_count          = 1
  dynatrace_instance_name = "yrk32651"
  env                     = "nonprod"
  network_zone            = "azure.cft"
  location                = "UK West"

  common_tags = local.common_tags
}
