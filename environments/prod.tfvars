project                    = "hmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

shutter_storage = "default"
cdn_sku         = "Standard_Verizon"
shutter_rg      = "shutter-app-prod-rg"

cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250", "10.13.31.250"]

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
  {
    name             = "sscs-tribunals"
    shutter          = "custom"
    mode             = "Detection"
    custom_domain    = "www.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-appeal-benefit-decision-service-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "sscs-tya"
    shutter          = "custom"
    mode             = "Detection"
    custom_domain    = "www.track-benefit-appeal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-track-benefit-appeal-service-gov-uk"
  },
  {
    name             = "sscs-cor"
    shutter          = "custom"
    mode             = "Detection"
    custom_domain    = "www.manage.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-appeal-benefit-decision-service-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
]
