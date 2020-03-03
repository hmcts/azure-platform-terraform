module "dynatrace_activegate" {
  source = "../../modules/dynatrace-activegate"
  instance_count = 3

  common_tags = local.common_tags
}