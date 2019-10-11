resource "azurerm_dns_a_record" "this" {
  count = length(local.a_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = coalesce(local.a_recordsets[count.index].name, "@")
  ttl     = local.a_recordsets[count.index].ttl
  records = local.a_recordsets[count.index].records
}