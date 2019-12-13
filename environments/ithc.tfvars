project                    = "hmcts"
component                  = "lz"
location                   = "uksouth"
env                        = "ithc"
subscription               = "ithc"
waf_mode                   = "Prevention"
enable_ssl                 = true
sslMode                    = "AzureKeyVault"
certificate_key_vault_name = "cftapps-ithc"

cft_apps_ag_ip_address = "10.10.7.124"
cft_apps_cluster_ips   = ["10.10.33.250", "10.10.35.250"]

frontends = [
  {
    name             = "decree-nisi-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "decree-absolute-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
]
