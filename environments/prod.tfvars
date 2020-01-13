project                    = "hmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
waf_mode                   = "Prevention"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

shutter_storage     = "default"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-prod-rg"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "www.apply-divorce.service.gov.uk",
  "www.respond-divorce.service.gov.uk",
  "www.decree-absolute.apply-divorce.service.gov.uk",
  "www.decree-nisi.apply-divorce.service.gov.uk",
]

cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250"]

frontends = [
  {
    name             = "div-dn"
    custom_domain    = "www.decree-nisi.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-nisi-apply-divorce-service-gov-uk"
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
    custom_domain    = "www.decree-absolute.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-absolute-apply-divorce-service-gov-uk"
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
    custom_domain    = "www.respond-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "respond-divorce-service-gov-uk"
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
    custom_domain    = "www.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-divorce-service-gov-uk"
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
]
