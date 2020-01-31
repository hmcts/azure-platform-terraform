// terraform doesn't let you have undeclared vars used from a tfvars file but no variable declaration
// we link this file into each component
// from the component dir: `ln -s ../../environments/variables.tf variables.tf`

variable subscription {}
variable env {}
variable project {}
variable resource_group_name {}

variable location {}

variable frontends {}

variable shutter_storage {}
variable default_shutter {
    default = []
}
variable cdn_sku {}

variable enable_ssl {}
variable ssl_mode {}
variable certificate_key_vault_name {}

variable cft_apps_cluster_ips {}
variable cft_apps_ag_ip_address {}
variable sscssya_shutter {
    default = []
}
variable sscstya_shutter {
    default = []
}
variable sscscor_shutter {
    default = []
}
