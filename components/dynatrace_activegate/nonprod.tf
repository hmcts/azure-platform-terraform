module "nonprod_dynatrace_activegate" {
  source         = "../../modules/dynatrace-activegate"
  instance_count = 2
  dynatrace_instance_name = "yrk32651"
  env = "nonprod"
  network_zone = "azure_cft"

  common_tags = local.common_tags
}
