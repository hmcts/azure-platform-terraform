locals {
  criticality = {
    sbox     = "Low"
    aat      = "High"
    prod     = "High"
    demo     = "Medium"
    ithc     = "Medium"
    ldata    = "Medium"
    perftest = "Medium"
    preview  = "Medium"
  }

  env_display_names = {
    sbox     = "Sandbox"
    aat      = "Staging"
    prod     = "Production"
    demo     = "Demo"
    ithc     = "ITHC"
    ldata    = "LDATA"
    perftest = "Test"
    preview  = "Dev"
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


  log_analytics_env_mapping = {
    sandbox = ["sbox"]
    nonprod = ["dev", "test", "ithc", "demo", "stg"]
    prod    = ["prod", "mgmt"]
  }
  log_analytics_workspace = {
    sandbox = {
      subscription_id = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
      name            = "hmcts-sandbox"
    }
    nonprod = {
      subscription_id = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
      name            = "hmcts-nonprod"
    }
    prod = {
      subscription_id = "8999dec3-0104-4a27-94ee-6588559729d1"
      name            = "hmcts-prod"
    }
  }
}