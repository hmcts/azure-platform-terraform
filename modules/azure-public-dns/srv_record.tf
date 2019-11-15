resource "azurerm_dns_srv_record" "this" {
  count = length(local.srv_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = coalesce(local.srv_recordsets[count.index].name, "@")
  ttl  = local.srv_recordsets[count.index].ttl

  dynamic "record" {
    for_each = local.srv_recordsets[count.index].records
    content {
      priority = split(" ", record.value)[0]
      weight   = split(" ", record.value)[1]
      port     = split(" ", record.value)[2]
      target   = split(" ", record.value)[3]
    }
  }

}