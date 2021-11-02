locals {
  env       = var.env == "sbox" ? "sandbox" : var.env == "test" ? "perftest" : var.env == "aat" ? "staging" : "${var.env}"
  vnet_rg   = "core-infra-${local.env}"
  vnet_name = "core-infra-vnet-${local.env}"
}
