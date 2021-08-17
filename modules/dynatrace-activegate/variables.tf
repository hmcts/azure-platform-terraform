variable "location" {
  default = "UK South"
}

variable "resource_group_name" {
  default = "aks-infra-cftptl-intsvc-rg"
}

variable "vnet_name" {
  default = "core-cftptl-intsvc-vnet"
}

variable "env" {
  default = "ptl"
}

variable "common_tags" {
  type = map(string)
}

variable "vault_name" {
  default = "cftptl-intsvc"
}

variable "vault_rg" {
  default = "core-infra-intsvc-rg"
}

variable "dynatrace_instance_name" {
  default = "ebe20728"
}

variable "network_zone" {
  default = ""
}

variable "instance_count" {
  default = 1
}

variable "sku" {
  default = "Standard_D2s_v3"
}

variable "dynatrace_plugins" {
  type    = list(string)
  default = ["custom.remote.python.snmp_palo_alto.zip"]
}

variable "storage_account_rg" {
  default = "core-infra-intsvc-rg"
}

variable "storage_account" {
  default = "cftptlintsvc"
}

variable "storage_container" {
  default = "plugin"
}

variable "config_file_name" {
  default = "cloudconfig"
}

variable "enable_log_analytics" {
  default = false
}

variable "install_splunk_uf" {
  default = false
}

variable "soc_vault_name" {
  default = "soc-prod"
}

variable "soc_vault_rg" {
  default = "soc-core-infra-prod-rg"
}

variable "splunk_username_secret" {
  default = "splunk-gui-admin-username"
}

variable "splunk_password_secret" {
  default = "splunk-gui-admin-password"
}

variable "splunk_pass4symmkey_secret" {
  default = "pass4SymmKey-forwarders-plaintext"
}
