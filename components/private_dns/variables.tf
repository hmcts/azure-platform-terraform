variable "subscription" {
  default = []
}
variable "env" {
  default = []
}
variable "project" {
  default = "hmcts"
}

variable "location" {
  default = "UK South"
}

variable "common_tags" {
  default = []
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that contains the DNS zones."
}

variable "zone_name" {
  description = "DNS zone to manage"
}

variable "vnet_links" {
  type    = list
  default = []
}

variable "a_recordsets" {
  type = list(object({
    name   = string
    ttl    = number
    record = list(string)
  }))

  default = []
}
