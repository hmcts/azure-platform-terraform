locals {

  gateways = yamldecode(data.local_file.configuration.content).gateways

  a_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.dns_zone}",
        ttl    = 300,
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      }
    ]
  ])

}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/backend_lb_config_arm_to_tf.yaml"
}


data "azurerm_private_dns_zone" "zone" {
  provider            = azurerm.privatedns
  name                = "service.core-compute-${local.dns_zone}.internal"
  resource_group_name = "core-infra-intsvc-rg"
}

resource "azurerm_private_dns_a_record" "appgw" {
  for_each            = { for record in var.a_recordsets : record.name => record }
  name                = lower(each.value.name)
  zone_name           = data.azurerm_private_dns_zone.zone.name
  resource_group_name = "core-infra-intsvc-rg"
  ttl                 = 300
  records             = each.value.record
  provider            = azurerm.privatedns
}

