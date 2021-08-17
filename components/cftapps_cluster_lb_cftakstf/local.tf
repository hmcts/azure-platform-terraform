locals {
  env = (var.env == "aat") ? "stg" : (var.env == "sbox_cft_akstf") ? "sbox" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  vnet_rg   = "cft-${local.env}-network-rg"
  vnet_name = "cft-${local.env}-vnet"
}
