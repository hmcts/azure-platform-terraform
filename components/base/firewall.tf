module "firewall" {
  source             = "../../modules/azure-firewall/"
  common_tags        = local.common_tags
  env                = var.env
  project            = var.project
  aks                = var.aks
  firewall           = var.firewall
}