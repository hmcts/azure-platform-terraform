locals {
  env = var.env

  vnet_rg     = var.env == "ithc" || var.env == "perftest" ? "hmcts-dmz-nonprodi" : "hmcts-hub-${var.env}-int"
  vnet_name   = var.env == "ithc" || var.env == "perftest" ? "hmcts-hub-nonprodi" : "hmcts-hub-${var.env}-int"
  subnet_name = "hub-appgw"
  hub_env     = (var.env == "demo" || var.env == "dev" || var.env == "ithc" || var.env == "perftest") ? "nonprod" : (var.env == "stg") ? "prod" : var.env

  key_vault_resource_group = "cft-platform-${var.subscription}-rg"
  key_vault_subscription   = var.key_vault_subscription


  hub = {
    sbox = {
      subscription = "ea3a8c1e-af9d-4108-bc86-a7e2d267f49c"
      ukSouth = {
        name              = "hmcts-hub-sbox-int"
        next_hop_ip       = "10.10.200.36"
        appgw_next_hop_ip = "20.90.242.134" # Azure Firewall
      }
    }
    nonprod = {
      subscription = "fb084706-583f-4c9a-bdab-949aac66ba5c"
      ukSouth = {
        name        = "hmcts-hub-nonprodi"
        next_hop_ip = "10.11.72.36"
      }
    }
    prod = {
      subscription = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
      ukSouth = {
        name        = "hmcts-hub-prod-int"
        next_hop_ip = "10.11.8.36"
      }
    }
  }
}
