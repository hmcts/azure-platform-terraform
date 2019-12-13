variable env {}
variable location {}
variable frontends {}
variable subscription {}
variable certificate_key_vault_name {}

variable cft_apps_cluster_ips {}
variable cft_apps_ag_ip_address {}

// these values are unused but here because of how the terraform is structure
// prevents issues with "undeclared variable"
variable "component" {}
variable "waf_mode" {}
variable "project" {}
variable "enable_ssl" {}
variable "sslMode" {}
// end unused