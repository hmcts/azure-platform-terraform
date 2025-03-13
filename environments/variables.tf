// terraform doesn't let you have undeclared vars used from a tfvars file but no variable declaration
// we link this file into each component
// from the component dir: `ln -s ../../environments/variables.tf variables.tf`

variable "subscription" {
  default = []
}

variable "key_vault_subscription" {
  default = []
}

variable "enable_waf" {
  default = false
}

variable "env" {
  default = []
}

variable "project" {
  default = "hmcts"
}

variable "product" {
}

variable "publisher_email" {
  default = "DTSPlatformOperations@justice.gov.uk"
}

variable "builtFrom" {
  default = "hmcts/azure-platform-terraform"
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

variable "pubsub_frontends" {
  default = []
}

variable "pubsub_endpoint" {
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
variable "frontend_agw_private_ip_address" {
  default = []
}
variable "pubsub_frontend_agw_private_ip_address" {
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

variable "hub_app_gw_private_ip_address" {
  default = []
}

variable "backend_agw_private_ip_address" {
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

variable "hub" {
  default = "sbox"
}

variable "waf_mode" {
  default = "Detection"
}

variable "route_next_hop_type" {
  default = "VirtualAppliance"
}

variable "apim_appgw_backend_pool_ips" {
  default = []
}

variable "apim_appgw_backend_pool_fqdns" {
  default = []
}

variable "apim_appgw_exclusions" {
  default = []
}

variable "expiresAfter" {
  description = "Date when Sandbox resources can be deleted. Format: YYYY-MM-DD"
  default     = "3000-01-01"
}

variable "backend_agw_min_capacity" {
  description = "Backend Appgw Min capacity"
  default     = 2
}

variable "frontend_agw_min_capacity" {
  description = "Frontend Appgw Min capacity"
  default     = 2
}

variable "backend_agw_max_capacity" {
  description = "Backend Appgw Min capacity"
  default     = 10
}

variable "frontend_agw_max_capacity" {
  description = "Frontend Appgw Max capacity"
  default     = 10
}

variable "apim_appgw_min_capacity" {
  default = 1
}

variable "autoShutdown" {
  default = false
}
variable "apim_appgw_max_capacity" {
  default = 2
}

variable "pubsub_waf_managed_rules" {
  default = []
}

variable "pubsub_waf_custom_rules" {
  default = []
}

variable "ssl_certificate" {
  default = ""
}

variable "pubsubappgw_ssl_policy" { 
  default = null 
}

