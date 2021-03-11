data "local_file" "configuration" {
  filename = var.yaml_path
}

module "azure-private-dns" {
  source = "git::https://github.com/hmcts/azure-private-dns.git?ref=master"

  providers = {
    azurerm      = "azurerm"
    azurerm.data = "azurerm.data"
  }

  yaml_path           = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  name                = yamldecode(data.local_file.sandbox-internal-configuration.content).A
  zone_name           = yamldecode(data.local_file.sandbox-internal-configuration.content).name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.record
}