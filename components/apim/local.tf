locals {
  env       = var.environment == "sbox" ? "sandbox" : var.environment == "test" ? "perftest" : var.environment == "aat" ? "staging" : "${var.env}"
  vnet_rg   = "core-infra-${local.env}"
  vnet_name = "core-infra-vnet-${local.env}"
}
