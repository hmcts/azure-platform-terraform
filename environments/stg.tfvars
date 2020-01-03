project                    = "hmcts"
location                   = "uksouth"
env                        = "aat"
subscription               = "stg"
waf_mode                   = "Prevention"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-stg"

shutter_storage     = "TODO"
cdn_sku             = "TODO"
resource_group_name = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

cft_apps_ag_ip_address = "10.10.24.123"
cft_apps_cluster_ips   = ["10.10.19.250", "10.10.23.250"]

frontends = [
  {
    name             = "decree-nisi-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "decree-absolute-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "respond-divorce-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "petitioner-frontend-aks"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI  = ["931130"],
      SQLI = ["942440"]
    }
  },
  {
    name             = "pet-app1"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
    }
  },
  {
    name             = "pet-app2"
    custom_domain    = "aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
    }
  },
]
