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
    name             = "div-dn"
    custom_domain    = "decree-nisi-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "div-da"
    custom_domain    = "decree-absolute-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "div-rfe"
    custom_domain    = "respond-divorce-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "div-pfe"
    custom_domain    = "petitioner-frontend-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "pet-app1"
    custom_domain    = "pet-app1.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
    }
  },
  {
    name             = "pet-app2"
    custom_domain    = "pet-app2.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
    }
  },
  {
    name          = "sscs-tribunals"
    custom_domain = "benefit-appeal.aat.platform.hmcts.net"
    backend_domain = [
    "firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942110",
        "942200",
        "942210",
        "942310",
        "942360",
        "942430",
        "942440",
        "942450",
      ]
    }
  },
  {
    name          = "sscs-cor"
    custom_domain = "sscs-cor.aat.platform.hmcts.net"
    backend_domain = [
    "firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942110",
        "942200",
        "942210",
        "942310",
        "942360",
        "942430",
        "942440",
        "942450",
      ]
    }
  },
  {
    name          = "sscs-tya"
    custom_domain = "track-appeal.aat.platform.hmcts.net"
    backend_domain = [
    "firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942110",
        "942200",
        "942210",
        "942310",
        "942360",
        "942430",
        "942440",
        "942450",
      ]
    }
  },
]
