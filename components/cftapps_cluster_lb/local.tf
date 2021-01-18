locals {
  criticality = {
    sbox     = "Low"
    aat      = "High"
    prod     = "High"
    ithc     = "Medium"
    perftest = "Medium"
    ldata    = "Medium"

  }

  env_display_names = {
    sbox     = "Sandbox"
    aat      = "Staging"
    prod     = "Production"
    ithc     = "ITHC"
    perftest = "Test"
    ldata    = "LDATA"
  }

  common_tags = {
    "managedBy"          = "Platform Engineering"
    "solutionOwner"      = "CFT"
    "activityName"       = "AKS"
    "dataClassification" = "Internal"
    "automation"         = ""
    "costCentre"         = "10245117" // until we get a better one, this is the generic cft contingency one
    "environment"        = local.env_display_names[var.env]
    "criticality"        = local.criticality[var.env]
  }

  vnet_rg   = "aks-infra-${var.env}-rg"
  vnet_name = "core-${var.env}-vnet"

}
