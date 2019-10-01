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

