resource "azurerm_dns_cname_record" "this" {
  count = length(local.cname_records)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name   = coalesce(local.cname_records[count.index].name, "@")
  ttl    = local.cname_records[count.index].ttl
  record = local.cname_records[count.index].data
}