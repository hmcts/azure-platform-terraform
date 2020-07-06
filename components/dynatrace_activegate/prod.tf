module "dynatrace_activegate" {
  source         = "../../modules/dynatrace-activegate"
  instance_count = 3
  network_zone   = "azure.cft"

  common_tags = local.common_tags
}
