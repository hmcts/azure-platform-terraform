project      = "hmcts"
location     = "uksouth"
env          = "preview"
subscription = "dev"
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}
ssl_certificate        = "wildcard-dev-platform-hmcts-net"
key_vault_subscription = "8b6ea922-0862-443e-af15-6056e1c9b9a4"

data_subscription = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
oms_env           = "nonprod"
autoShutdown      = true
frontends = [
  {
    name           = "hmi-apim"
    custom_domain  = "hmi-apim.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-hmiapimdev.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
  },
  {
    name                           = "reformscan"
    custom_domain                  = "reformscan.preview.platform.hmcts.net"
    dns_zone_name                  = "preview.platform.hmcts.net"
    backend_domain                 = ["firewall-prod-int-palo-reformscanpreview.uksouth.cloudapp.azure.com"]
    appgw_cookie_based_affinity    = "Enabled"
    cache_enabled                  = "false"
    certificate_name_check_enabled = false
  },
  {
    name                   = "csds-active"
    custom_domain          = "csds.dev.apps.hmcts.net"
    dns_zone_name          = "dev.apps.hmcts.net"
    backend_domain         = ["csds-active.dev.platform.hmcts.net"]
    disabled_rules         = {}
    disable_frontend_appgw = true
    forwarding_protocol    = "HttpsOnly"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "session_state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "quickFilter"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "crit"
      },
    ]
  },
  {
    name                   = "csds-passive"
    custom_domain          = "csds-passive.dev.apps.hmcts.net"
    dns_zone_name          = "dev.apps.hmcts.net"
    backend_domain         = ["csds-passive.dev.platform.hmcts.net"]
    disabled_rules         = {}
    disable_frontend_appgw = true
    forwarding_protocol    = "HttpsOnly"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "session_state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "quickFilter"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "crit"
      },
    ]
  },
  {
    name          = "courtstranscribe"
    custom_domain = "courtstranscribe.dev.apps.hmcts.net"
    dns_zone_name = "dev.apps.hmcts.net"
    backend_domain = [
      "hmcts-transcribe-frontend-dev.azurewebsites.net"
    ]
    mode                           = "Detection"
    appgw_cookie_based_affinity    = "Enabled"
    cache_enabled                  = "false"
    forwarding_protocol            = "HttpsOnly"
    certificate_name_check_enabled = true
    private_link = {
      target_id   = "/subscriptions/8b6ea922-0862-443e-af15-6056e1c9b9a4/resourceGroups/courtstranscribe-dev-rg/providers/Microsoft.Web/sites/hmcts-transcribe-frontend-dev"
      location    = "uksouth"
      target_type = "sites"
    }
    disabled_rules = {
      SQLI = [
        "942430",
        "942440",
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "id_token"
      },
    ],
    rule_sets = [
      {
        name = "courtstranscribe-backend"
        rules = [
          {
            name              = "HMCTSCourtsTranscribeBackend"
            order             = 1
            behavior_on_match = "Stop"
            conditions = {
              url_path_conditions = [
                {
                  operator         = "BeginsWith"
                  negate_condition = false
                  match_values = [
                    "api/"
                  ]
                  transforms = ["Lowercase"]
                }
              ]
            }
            actions = {
              route_configuration_override_actions = [
                {
                  cdn_frontdoor_origin_group_key = "courtstranscribe-backend"
                  forwarding_protocol            = "HttpsOnly"
                  cache_behavior                 = "Disabled"
                }
              ]
            }
          },
          {
            name              = "HMCTSCourtsTranscribeStorage"
            order             = 2
            behavior_on_match = "Stop"
            conditions = {
              url_path_conditions = [
                {
                  operator         = "BeginsWith"
                  negate_condition = false
                  match_values = [
                    "application-data/",
                    "transcription-processing/",
                    "storage/",
                  ]
                  transforms = ["Lowercase"]
                }
              ]
            }
            actions = {
              route_configuration_override_actions = [
                {
                  cdn_frontdoor_origin_group_key = "courtstranscribe-storage"
                  forwarding_protocol            = "HttpOnly"
                  cache_behavior                 = "Disabled"
                }
              ]
            }
          },
          {
            name              = "HMCTSCourtsTranscribeFrontend"
            order             = 3
            behavior_on_match = "Stop"
            conditions = {
              url_path_conditions = [
                {
                  operator         = "BeginsWith"
                  negate_condition = true
                  match_values = [
                    "api/",
                    "application-data/",
                    "transcription-processing/",
                    "storage/",
                  ]
                  transforms = ["Lowercase"]
                }
              ]
            }
            actions = {
              route_configuration_override_actions = [
                {
                  cdn_frontdoor_origin_group_key = "courtstranscribe"
                  forwarding_protocol            = "HttpOnly"
                  cache_behavior                 = "Disabled"
                }
              ]
            }
          }
        ]
      }
    ]
  },
  {
    name          = "courtstranscribe-backend"
    custom_domain = "courtstranscribe.dev.apps.hmcts.net"
    dns_zone_name = "dev.apps.hmcts.net"
    backend_domain = [
      "hmcts-transcribe-backend-dev.azurewebsites.net"
    ]
    mode                           = "Detection"
    appgw_cookie_based_affinity    = "Enabled"
    cache_enabled                  = "false"
    forwarding_protocol            = "HttpsOnly"
    certificate_name_check_enabled = true
    private_link = {
      target_id   = "/subscriptions/8b6ea922-0862-443e-af15-6056e1c9b9a4/resourceGroups/courtstranscribe-dev-rg/providers/Microsoft.Web/sites/hmcts-transcribe-backend-dev"
      location    = "uksouth"
      target_type = "sites"
    }
  },
  {
    name           = "courtstranscribe-storage"
    custom_domain  = "courtstranscribe.dev.apps.hmcts.net"
    dns_zone_name  = "dev.apps.hmcts.net"
    backend_domain = ["hmctstranscribedevsa.blob.core.windows.net"]
    host_header    = "hmctstranscribedevsa.blob.core.windows.net"

    private_link = {
      target_id   = "/subscriptions/8b6ea922-0862-443e-af15-6056e1c9b9a4/resourceGroups/courtstranscribe-dev-rg/providers/Microsoft.Storage/storageAccounts/hmctstranscribedevsa"
      location    = "uksouth"
      target_type = "blob"
    }

    forwarding_protocol = "HttpsOnly"
    cache_enabled       = "false"
  }
]
