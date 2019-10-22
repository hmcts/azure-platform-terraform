project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "sbox"
subscription = "sbox"
waf_mode  = "Detection"
enablessl = true
sslMode   = "AzureKeyVault"

frontends = [
  {
    name             = "plum"
    custom_domain    = "sandbox.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules = {}
  },
]