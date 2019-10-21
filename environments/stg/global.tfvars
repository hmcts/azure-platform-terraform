project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "aat"
subscription = "stg"
waf_mode  = "Prevention"
enablessl = false
sslMode   = "AzureKeyVault"

frontends = [
  {
    name             = "decress-nisi-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.aat.platform.hmcts.net"]
    certificate_name = "STAR-aat-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "decress-absolute-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.aat.platform.hmcts.net"]
    certificate_name = "STAR-aat-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.aat.platform.hmcts.net"]
    certificate_name = "STAR-aat-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.aat.platform.hmcts.net"]
    certificate_name = "STAR-aat-platform-hmcts-net"
    disabled_rules = {}
  },
]