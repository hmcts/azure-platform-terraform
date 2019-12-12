project                    = "hmcts"
component                  = "lz"
location                   = "uksouth"
env                        = "aat"
subscription               = "stg"
waf_mode                   = "Prevention"
enable_ssl                 = true
sslMode                    = "AzureKeyVault"
certificate_key_vault_name = "cftapps-stg"

frontends = [
  {
    name             = "decree-nisi-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "decree-absolute-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "pet-app1"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      SQLI = ["942440"]
    }
  },
]
