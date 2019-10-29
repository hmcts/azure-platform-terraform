project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "sbox"
subscription = "sbox"
waf_mode  = "Detection"
enable_ssl = true
sslMode   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

frontends = [
  {
    name             = "plum"
    custom_domain    = "sandbox.platform.hmcts.net"
    backend_domain   = ["uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules = {}
  },
]

# Palo Configuration for traffic to PaloAlto firewall
# this is kept separate as not all frontend traffic will go through Palo Alto firewall
paloConfig = []