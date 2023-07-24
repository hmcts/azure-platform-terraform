locals {
  vnet_rg   = "cft-${var.env}-network-rg"
  vnet_name = "cft-${var.env}-vnet"

  hub = {
    nonprod = {
      subscription = "fb084706-583f-4c9a-bdab-949aac66ba5c"
      ukSouth = {
        name         = "hmcts-hub-nonprodi"
        peering_name = "hubUkSnonprod"
        next_hop_ip  = "10.11.72.36"
      }
    }
    sbox = {
      subscription = "ea3a8c1e-af9d-4108-bc86-a7e2d267f49c"
      ukSouth = {
        name         = "hmcts-hub-sbox-int"
        peering_name = "hubUkS"
        next_hop_ip  = "10.10.200.36"
      }
    }
    prod = {
      subscription = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
      ukSouth = {
        name         = "hmcts-hub-prod-int"
        peering_name = "hubUkS"
        next_hop_ip  = "10.11.8.36"
      }
    }
  }

}
