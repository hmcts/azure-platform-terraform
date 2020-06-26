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

variable "dynatrace_nonprod_instance_name" {
  default = "yrk32651"
}

variable "instance_count" {
  default = 1
}

variable "sku" {
  default = "Standard_D2s_v3"
}