locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  vnet_rg   = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "prod" || var.env == "demo" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "prod" || var.env == "demo" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"

  key_vault_resource_group = "cft-platform-${var.subscription}-rg"

  # To be removed once the TLS1.0/1.1 deprecation is complete
  current_ssl_policy = {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20150501"
  }
}
