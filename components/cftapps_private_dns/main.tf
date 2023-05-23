locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  dns_zone = (var.env == "sbox") ? "sandbox" : "${var.env}"

  gateways = yamldecode(data.local_file.configuration.content).gateways

  # <XXX>.internal
  internal_records = flatten([
  for gateways, gateway in local.gateways : [
    for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.dns_zone}"
        ttl    = 300
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      } if !can(app, "ssl_enabled") || app.ssl_enabled == false
  ]
  ])

  # <XXX>.<ENV>.platform.hmcts.net
  platform_records = flatten([
  for gateways, gateway in local.gateways : [
    for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}-${local.dns_zone}"
        ttl    = 300
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      } if can(app, "ssl_enabled") && app.ssl_enabled == true
  ]
  ])
}

variable "dns_records" {
  type = map(object({
    a_recordset = string
    zone_name = string
  }))
  default = {
     internal_dns = {
      a_recordset = local.internal_records
      zone_name = "service.core-compute-${local.dns_zone}.internal"
    }
    platform_dns = {
      a_recordset = local.platform_records
      zone_name = "${local.env}.platform.hmcts.net"
    }
  }
}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
}

module "privatedns" {
  for_each = var.dns_records

  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = each.value.a_recordset
  env                 = local.dns_zone
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = each.value.zone_name

}
