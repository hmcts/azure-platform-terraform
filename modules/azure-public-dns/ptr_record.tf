resource "azurerm_dns_ptr_record" "this" {
  count = length(local.ptr_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = coalesce(local.ptr_recordsets[count.index].name, "@")
  ttl     = local.ptr_recordsets[count.index].ttl
  records = local.ptr_recordsets[count.index].records
}