variable "resource_group_name" {}
variable "env" {}
variable "common_tags" {}
variable "shutter_storage" {}
variable "frontends" {
  type = list(object({
    name = string, custom_domain = string, certificate_name = string, certificate_version = string
  }))
}
variable "cdn_sku" {}
variable "certificate_key_vault_name" {}