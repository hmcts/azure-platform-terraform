locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  dns_zone = (var.env == "sbox") ? "sandbox" : "${var.env}"

  gateways = yamldecode(data.local_file.configuration.content).gateways

  # <XXX>.internal
  internal_zone_name = "service.core-compute-${local.dns_zone}.internal"
  internal_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.dns_zone}",
        ttl    = 300,
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      } if !contains(keys(app), "platform_record") ? true : !app.platform_record
    ]
  ])

  # <XXX>.<ENV>.platform.hmcts.net
  platform_zone_name = "${local.dns_zone}.platform.hmcts.net"
  platform_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}",
        ttl    = 300,
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      } if contains(keys(app), "platform_record") ? app.platform_record : false
    ]
  ])

}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
}

# <XXX>.internal
module "privatedns" {
  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = local.internal_records
  env                 = local.dns_zone
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = local.internal_zone_name
}

# # <XXX>.<ENV>.platform.hmcts.net
module "privatedns_platform" {
  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = local.platform_records
  env                 = local.dns_zone
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = local.platform_zone_name
  create_zone         = false
}