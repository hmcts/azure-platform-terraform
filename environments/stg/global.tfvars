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
    disabled_rules = {
      RFI  = ["931130"],
    }
  },
  {
    name             = "decree-absolute-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
    }
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
    }
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
    }
  },
]

# Palo Configuration for traffic to PaloAlto firewall
# this is kept separate as not all frontend traffic will go through Palo Alto firewall
paloConfig = [
  {
    frontend       = "petitioner-frontend-aks"
    custom_domain  = "aat.platform.hmcts.net"
    backend_domain = ["uksouth.cloudapp.azure.com"]
    backend        = "hmcts-dmz-nonprodi-palo-inet-out"
    url_pattern    = ["/petitioner-respondent/marriage-certificate-upload"]
  },
]