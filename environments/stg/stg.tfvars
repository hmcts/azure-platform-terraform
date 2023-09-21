project                = "hmcts"
location               = "uksouth"
env                    = "aat"
subscription           = "stg"
certificate_name_check = false

backend_agw_private_ip_address = ["10.10.161.100", "10.10.161.101"]
data_subscription              = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
privatedns_subscription        = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                        = "nonprod"
autoShutdown                   = true
hub                            = "prod"

shutter_storage = "TODO"
cdn_sku         = "TODO"
shutter_rg      = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

frontend_agw_private_ip_address = "10.10.161.102"
cft_apps_cluster_ips            = ["10.10.143.250", "10.10.159.250"]

publisher_email = "DTSPlatformOps@HMCTS.NET"

frontends = [
  {
    name           = "plum"
    custom_domain  = "plum.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "div-dn"
    custom_domain  = "decree-nisi-aks.aat.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-da"
    custom_domain  = "decree-absolute-aks.aat.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-rfe"
    custom_domain  = "respond-divorce-aks.aat.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-pfe"
    custom_domain  = "petitioner-frontend-aks.aat.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "reasonForDivorceBehaviourDetails"
      },
    ]
  },
  {
    name           = "pet-app1"
    custom_domain  = "pet-app1.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "pet-app2"
    custom_domain  = "pet-app2.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "sscs-tribunals"
    custom_domain  = "benefit-appeal.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reasonForNoMRN"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reasonForBeingLate"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "nino"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "signer"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "selection.signLanguage.language"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "selection.anythingElse.language"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    name           = "sscs-cor"
    mode           = "Detection"
    custom_domain  = "sscs-cor.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "question-field"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "describeTheEvidence"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    name           = "sscs-tya"
    mode           = "Detection"
    custom_domain  = "track-appeal.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp"
    mode           = "Detection"
    custom_domain  = "manage-case.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-manage-org"
    mode           = "Detection"
    custom_domain  = "manage-org.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-approve-org"
    mode           = "Detection"
    custom_domain  = "administer-orgs.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-register-org"
    mode           = "Detection"
    custom_domain  = "register-org.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "civil-citizen-ui"
    mode           = "Detection"
    custom_domain  = "civil-citizen-ui.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "cmc"
    mode           = "Detection"
    custom_domain  = "moneyclaims.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "cmc-legal"
    mode           = "Detection"
    custom_domain  = "moneyclaims-legal.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "fact"
    mode           = "Prevention"
    custom_domain  = "fact.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "i18next"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fact-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_oauth2_proxy"
      }
    ]
  },
  {
    name           = "fact-admin"
    mode           = "Detection"
    custom_domain  = "fact-admin.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "rpts"
    mode           = "Prevention"
    custom_domain  = "rpts.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "81.134.202.29/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
              "194.33.192.0/25",
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "51.140.8.67/32",
              "20.50.109.148/32",
              "20.50.108.242/32",
              "51.11.124.205/32",
              "51.11.124.216/32",
              "62.25.109.203/32",
              "20.108.187.55/32"
            ]
          }
        ]
      },
    ]

  },
  {
    name           = "nfdiv"
    mode           = "Detection"
    custom_domain  = "nfdiv.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name          = "nfdiv-apply"
    mode          = "Detection"
    custom_domain = "nfdiv-apply-for-divorce.aat.platform.hmcts.net"
    backend       = "nfdiv"

  },
  {
    name          = "nfdiv-civil"
    mode          = "Detection"
    custom_domain = "nfdiv-end-civil-partnership.aat.platform.hmcts.net"
    backend       = "nfdiv"
  },
  {
    name           = "et-sya"
    mode           = "Detection"
    custom_domain  = "et-sya.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "ia-aip"
    mode           = "Detection"
    custom_domain  = "immigration-appeal.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "wa-proto-frontend"
    mode           = "Detection"
    custom_domain  = "wa-proto-frontend.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "gateway-ccd"
    mode           = "Detection"
    custom_domain  = "gateway-ccd.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "return-case-doc-ccd"
    mode           = "Detection"
    custom_domain  = "return-case-doc-ccd.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "pcq"
    mode           = "Prevention"
    custom_domain  = "pcq.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "returnUrl"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "pcq-cookie-preferences"
      },
      // Google Analytics Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      // Dynatrace Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      }
    ],
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "QueryString"
            selector           = "returnUrl"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "10.100.40.241/3000",
              "10.100.40.242/3000",
              "10.100.40.243/3000",
              "10.100.40.245/3000",
              "10.100.40.246/3000"
            ]
          }
        ]
      },
    ]
  },
  {
    name           = "lau"
    mode           = "Detection"
    custom_domain  = "lau.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "lau-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "lau-session"
      },
    ]
  },
  {
    name           = "judicial-payments"
    mode           = "Detection"
    custom_domain  = "judicial-payments.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "adoption"
    custom_domain  = "adoption.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "adoption-web"
    custom_domain  = "adoption-web.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "probate"
    custom_domain  = "probate.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ],
    disabled_rules = {
      RCE = [
        "932115"
      ]
    }
  },
  {
    name           = "idam-web-public"
    custom_domain  = "idam-web-public.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_preferences_set"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "seen_cookie_message"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "label"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "username"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "email"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "response_type"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.SSOSession"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "session_state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "id_token_hint"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_verifier"
      }
    ]
  },
  {
    product        = "idam"
    name           = "hmcts-access"
    mode           = "Detection"
    custom_domain  = "hmcts-access.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "paybubble"
    custom_domain  = "paybubble.aat.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__user-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__pcipal-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ccpay-bubble-cookie-preferences"
      },
    ]
  },
  {
    name           = "bar"
    custom_domain  = "bar.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "fees-register"
    custom_domain  = "fees-register.aat.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = false
            match_values = [
              "/fees"
            ]
          },
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "81.134.202.29/32",
              "51.145.6.230/32",
              "194.33.192.0/25",
              "51.149.249.0/27",
              "194.33.193.0/25",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "194.33.197.0/25",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "51.143.139.240/32",
              "51.145.4.100/32"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fee-register-admin-web-cookie-preferences"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "QueryParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedPath"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "PostParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "expression"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "GroupName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "NFuse_Application"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "banner_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "callback"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reply_message_template"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "name"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "User-Agent"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "content-type"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "csvFees"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "description"
      },
    ]
  },
  {
    name                        = "idam-web-admin"
    custom_domain               = "idam-web-admin.aat.platform.hmcts.net"
    backend_domain              = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name            = "wildcard-aat-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "20.50.109.148/32",
              "20.50.108.242/32",
              "51.11.124.216/32",
              "51.11.124.205/32",
              "81.134.202.29/32",
              "51.104.22.147/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
              "194.33.192.0/25",
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "activationRedirectUrl"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "activationRedirectUrl"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "label"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientId"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "oauth2RedirectUris"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2RedirectUris"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
    ]
  },
  {
    name             = "idam-user-dashboard"
    custom_domain    = "idam-user-dashboard.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "20.50.109.148/32",
              "20.50.108.242/32",
              "51.11.124.216/32",
              "51.11.124.205/32",
              "81.134.202.29/32",
              "51.104.22.147/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
              "194.33.192.0/25",
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "20.108.187.55/32"
            ]
          }
        ]
      }
    ],
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "idam-user-dashboard-session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "idam_user_dashboard_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "auth_verification"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "response_type"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_csrf"
      }
    ]
  },
  {
    name                = "reformscan"
    custom_domain       = "reformscan.aat.platform.hmcts.net"
    host_header         = "reformscanaat.blob.core.windows.net"
    backend_domain      = ["firewall-prod-int-palo-reformscanaat.uksouth.cloudapp.azure.com"]
    certificate_name    = "wildcard-aat-platform-hmcts-net"
    forwarding_protocol = "MatchRequest"
    health_path         = "/"
    health_protocol     = "Https"
    cache_enabled       = "false"
  },
  {
    name                = "reformscanstg"
    custom_domain       = "reformscanstg.aat.platform.hmcts.net"
    host_header         = "reformscanaatstaging.blob.core.windows.net"
    backend_domain      = ["firewall-prod-int-palo-reformscanaatstg.uksouth.cloudapp.azure.com"]
    certificate_name    = "wildcard-aat-platform-hmcts-net"
    forwarding_protocol = "MatchRequest"
    health_path         = "/"
    health_protocol     = "Https"
    cache_enabled       = "false"
  },
  {
    name           = "ds-ui"
    custom_domain  = "ds-ui.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "fis-ds-web"
    custom_domain  = "fis-ds-web.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "sptribs-frontend"
    custom_domain  = "sptribs-frontend.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "privatelaw"
    custom_domain  = "privatelaw.aat.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name             = "hmi-apim"
    custom_domain    = "hmi-apim.staging.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-hmiapimaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-staging-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product          = "cft-api-mgmt"
    name             = "cft-api-mgmt"
    custom_domain    = "cft-api-mgmt.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftapimgmtstg.uksouth.cloudapp.azure.com"]
    certificate_name = "cft-api-mgmt-aat-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name           = "paymentoutcome-web"
    mode           = "Detection"
    custom_domain  = "paymentoutcome-web.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    www_redirect   = true
  },
  {
    product        = "em"
    name           = "em-icp"
    mode           = "Detection"
    custom_domain  = "em-icp.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]

  },
  {
    product          = "dss-update-case"
    name             = "dss-update-case"
    mode             = "Detection"
    custom_domain    = "dss-update-case.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    cache_enabled    = "false"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    product        = "cui"
    name           = "cui-ra"
    custom_domain  = "cui-ra.aat.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"],
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cui-session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    product          = "et-pet-et1"
    name             = "et-pet-et1"
    mode             = "Prevention"
    custom_domain    = "et-pet-et1.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_app_session"
      },
    ]
  },
  {
    product          = "et-pet-et3"
    name             = "et-pet-et3"
    mode             = "Prevention"
    custom_domain    = "et-pet-et3.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_app_session"
      },
    ]
  },
  {
    product          = "et-pet-admin"
    name             = "et-pet-admin"
    mode             = "Prevention"
    custom_domain    = "et-pet-admin.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_app_session"
      },
    ]
  },
  {
    product          = "tax-tribunals-datacapture"
    name             = "tax-tribunals-datacapture"
    custom_domain    = "tax-tribunals-datacapture.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_tax-tribunals-datacapture_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utma"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmb"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmc"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmz"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "steps_closure_support_documents_form[having_problems_uploading][]"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "steps_closure_support_documents_form"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "steps_details_documents_upload_form"
      }
    ]
  },
  {
    product          = "help-with-fees-publicapp"
    name             = "help-with-fees-publicapp"
    mode             = "Prevention"
    custom_domain    = "hwf-publicapp.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_hwf-publicapp_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      }
    ]
  },
  {
    product          = "help-with-fees-staffapp"
    name             = "help-with-fees-staffapp"
    mode             = "Prevention"
    custom_domain    = "hwf-staffapp.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftaat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_fr-staffapp_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fr_username"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "homepage_visited_timestamp"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "notification[message]"
      }

    ]
  },
]
