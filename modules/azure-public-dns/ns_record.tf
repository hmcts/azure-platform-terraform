resource "azurerm_dns_ns_record" "this" {
  count = length(local.ns_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = coalesce(local.ns_recordsets[count.index].name, "@")
  ttl     = local.ns_recordsets[count.index].ttl
  records = local.ns_recordsets[count.index].records

}