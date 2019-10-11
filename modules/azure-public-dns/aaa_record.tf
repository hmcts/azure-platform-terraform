resource "azurerm_dns_aaaa_record" "this" {
  count = length(local.aaaa_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = coalesce(local.aaaa_recordsets[count.index].name, "@")
  ttl     = local.aaaa_recordsets[count.index].ttl
  records = local.aaaa_recordsets[count.index].records
}