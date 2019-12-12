variable cft_apps_cluster_ips {}
variable env {}
variable frontends {}
variable location {}
variable cft_apps_ag_ip_address {}
variable subscription {}
variable certificate_key_vault_name {}


// these values are unused but here because of how the terraform is structure
// prevents issues with "undeclared variable"
variable "component" {}
variable "waf_mode" {}
variable "project" {}
variable "enable_ssl" {}
variable "sslMode" {}
// end unused