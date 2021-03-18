locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  dns_zone = (var.env == "sbox") ? "sandbox" : "${var.env}"

  gateways = yamldecode(data.local_file.configuration.content).gateways

  a_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.env}",
        ttl    = 300,
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      }
    ]
  ])

}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
}

module "privatedns" {
  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = local.a_records
  env                 = local.env
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = "service.core-compute-${local.dns_zone}.internal"
}
#