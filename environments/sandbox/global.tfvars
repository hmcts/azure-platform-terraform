project   = "hmcts"
component = "frontdoor"
location  = "uksouth"
env       = "sandbox"
waf_mode  = "Detection"
enablessl = false

frontends = [
  {
    name           = "plum"
    custom_domain  = "sandbox.platform.hmcts.net"
    backend_domain = ["uksouth.sandbox.platform.hmcts.net"]
    disabled_rules = {}
  },
]