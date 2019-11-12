env       = "prod"
project   = "hmcts"
component = "lz"
ddosplan  = "basic"

aks = [
  {
    vnet_name = "core-prod-vnet",
    rg_name   = "aks-infra-prod-rg"
    rt_name   = "aks-route-table"
  },
]

firewall = [
  {
    hub_vnet       = "10.150.0.0/24"
    priority       = "200"
    location       = "uksouth"
    aks_dnat_rules = ["10.13.15.250", "10.13.31.250"]
  }
]