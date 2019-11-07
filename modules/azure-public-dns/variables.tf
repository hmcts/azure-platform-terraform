variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that contains the DNS zone where the records will be added."
}

variable "zone_name" {
  description = "List of DNS zones to manage, in the standard terraformdns structure."
}

variable "recordsets" {
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  description = "List of DNS records to manage, in the standard terraformdns structure."
}   