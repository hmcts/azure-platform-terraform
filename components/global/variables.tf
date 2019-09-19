variable env {}
variable project {}
variable component {}
variable location {}
variable custom_domain_name {}
variable frontend_hosts {
    type = "list"
}
variable backend_domain {
    type = "list"
}
variable "common_tags" {}
variable "waf_mode" {}
variable "disabled_waf_rules" {}