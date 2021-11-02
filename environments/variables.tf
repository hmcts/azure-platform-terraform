// terraform doesn't let you have undeclared vars used from a tfvars file but no variable declaration
// we link this file into each component
// from the component dir: `ln -s ../../environments/variables.tf variables.tf`

variable "subscription" {
  default = []
}

variable "env" {
  default = []
}

variable "project" {
  default = "hmcts"
}

variable "product" {
}

variable "builtFrom" {
}

variable "shutter_rg" {
  default = "TODO"
}

variable "location" {
  default = "UK South"
}

variable "frontends" {
  default = []
}

variable "shutter_storage" {
  default = "TODO" // Is this even used?
}
variable "default_shutter" {
  default = []
}

variable "cdn_sku" {
  default = "Standard_Verizon"
}

variable "ssl_mode" {
  default = "FrontDoor"
}

variable "cft_apps_cluster_ips" {
  default = []
}
variable "cft_apps_ag_ip_address" {
  default = []
}
variable "sscssya_shutter" {
  default = []
}
variable "sscstya_shutter" {
  default = []
}
variable "sscscor_shutter" {
  default = []
}

variable "app_gw_private_ip_address" {
  default = []
}

variable "mgmt_vnet_name" {
  default = "TODO"
}
variable "mgmt_rg_name" {
  default = "TODO"
}
variable "kv_rg_name" {
  default = "TODO"
}

variable "data_subscription" {}

variable "privatedns_subscription" {
  default = "TODO"
}
variable "oms_env" {}

variable "certificate_name_check" {
  default = true
}
variable "common_tags" {
  default = []
}

variable "add_access_policy" {
  default = true
}

variable "department" {
  default = "cft"
}

variable "apim_sku_name" {
  default = "Developer"
}

variable "apim_subnet_address_prefix" {
  default = []
}