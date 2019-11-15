resource "azurerm_dns_txt_record" "this" {
  count = length(local.txt_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = coalesce(local.txt_recordsets[count.index].name, "@")
  ttl  = local.txt_recordsets[count.index].ttl

  dynamic "record" {
    for_each = local.txt_recordsets[count.index].records
    content {
      value = record.value
    }
  }

}