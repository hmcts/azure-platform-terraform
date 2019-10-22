project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "aat"
subscription = "stg"
waf_mode  = "Prevention"
enable_ssl = true
sslMode   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-stg"

frontends = [
  {
    name             = "decree-nisi-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "decree-absolute-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {}
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {}
  },
]