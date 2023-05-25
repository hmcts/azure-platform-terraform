locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  dns_zone = (var.env == "sbox") ? "sandbox" : "${var.env}"

  gateways = yamldecode(data.local_file.configuration.content).gateways

  # <XXX>.internal
  internal_zone_name = "service.core-compute-${local.dns_zone}.internal"
  internal_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.dns_zone}"
        ttl    = 300
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      } if app.ssl_enabled == false
    ]
  ])

  # <XXX>.<ENV>.platform.hmcts.net
  platform_zone_name = "${local.env}.platform.hmcts.net"
  platform_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.dns_zone}"
        ttl    = 300
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      } if app.ssl_enabled == true
    ]
  ])

}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
}

# <XXX>.internal
module "privatedns" "internal_dns_zone_records" {
  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = local.internal_records
  env                 = local.dns_zone
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = local.internal_zone_name
}

# <XXX>.<ENV>.platform.hmcts.net
module "privatedns" "platform_dns_zone_records" {
  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = local.platform_records
  env                 = local.dns_zone
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = local.platform_zone_name
}