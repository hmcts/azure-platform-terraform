locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  vnet_rg     = var.env == "sbox" ? "hmcts-hub-${var.env}-int" : "hmcts-hub-${var.env}-int"
  vnet_name   = var.env == "sbox" ? "hmcts-hub-${var.env}-int" : "hmcts-hub-${var.env}-int"
  subnet_name = "hub-appgw"

  key_vault_resource_group = "cft-platform-${var.subscription}-rg"

  apim {
    sbox {
      dest_ip = "20.58.19.69"
    }
  }

  palo = {
    sbox = {
      ukSouth = {
        next_hop_ip = "10.10.200.36"
      }
      ukWest = {
        next_hop_ip = "10.48.200.36"
      }
    }
    nonprod = {
      ukSouth = {
        next_hop_ip = "10.11.72.36"
      }
      ukWest = {
        next_hop_ip = "10.49.72.36"
      }
    }
    prod = {
      ukSouth = {
        next_hop_ip = "10.11.8.36"
      }
      ukWest = {
        next_hop_ip = "10.49.8.36"
      }
    }
  }
}