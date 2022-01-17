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

variable "location" {
  default = "UK South"
}

variable "frontends" {
  default = []
}

variable "oms_env" {}

variable "waf_mode" {
  default = "Detection"
}

variable "hub" {
  default = "sbox"
}

variable "route_next_hop_type" {
  default = "VirtualAppliance"
}
