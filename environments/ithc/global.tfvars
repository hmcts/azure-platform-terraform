project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "ithc"
subscription = "ithc"
waf_mode  = "Prevention"
enablessl = false
sslMode   = "AzureKeyVault"

frontends = [
  {
    name             = "decree-nisi-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["uksouth.ithc.platform.hmcts.net"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "decree-absolute-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["uksouth.ithc.platform.hmcts.net"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["uksouth.ithc.platform.hmcts.net"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["uksouth.ithc.platform.hmcts.net"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {}
  },
]