firewall_location   = ["uksouth"]
vnet_cidr           = ["10.102.0.0/24"]
env                 = "sandbox"
project             = "hmcts"
common_tags         = {
    "managedBy"          = "Platform Engineering"
    "solutionOwner"      = "CFT"
    "activityName"       = "AKS"
    "dataClassification" = "Internal"
    "automation"         = ""
    "costCentre"         = "10245117" // until we get a better one, this is the generic cft contingency one
    "environment"        = "sandbox"
    "criticality"        = "Medium"
  }

aks = [
  {
    vnet_name = "core-sbox-vnet",
    rg_name = "aks-infra-sbox-rg"
    rt_name = "aks-route-table"
  },
]

dnat_rules = [
  {
    location = "uksouth"
    aks_lb   = [ "10.10.1.250", "10.10.3.250"]
  },
]