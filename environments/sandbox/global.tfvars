project   = "hmcts"
component = "frontdoor"
location  = "uksouth"
env       = "sandbox"
waf_mode  = "Detection"
enablessl = false

sslMode   = "FrontDoor"
keyVault_name = "cftapps-sbox"
keyVault_rg   = "core-infra-sbox-rg"

frontends = [
  {
    name           = "plum"
    custom_domain  = "sandbox.platform.hmcts.net"
    backend_domain = ["uksouth.sandbox.platform.hmcts.net"]
    disabled_rules = {}
  },
]