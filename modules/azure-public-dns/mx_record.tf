resource "azurerm_dns_mx_record" "this" {
  count = length(local.mx_recordsets)

  resource_group_name = lower(lower(var.resource_group_name))
  zone_name           = var.zone_name

  name = coalesce(local.mx_recordsets[count.index].name, "@")
  ttl  = local.mx_recordsets[count.index].ttl

  dynamic "record" {
    for_each = local.mx_recordsets[count.index].records
    content {
      preference = split(" ", record.value)[0]
      exchange   = split(" ", record.value)[1]
    }
  }
}