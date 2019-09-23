module "landing_zone" {
  source             = "../../modules/azure-landing-zone/"
  common_tags        = local.common_tags
  env                = var.env
  project            = var.project
  component          = var.component
  location           = var.location
  custom_domain_name = var.custom_domain_name
  backend_domain     = var.backend_domain
  waf_mode           = var.waf_mode
  frontends          = var.frontends
}