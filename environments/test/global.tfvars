project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "perftest"
subscription = "test"
waf_mode  = "Detection"
enable_ssl = false
sslMode   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-test"

frontends = []

# Palo Configuration for traffic to PaloAlto firewall
# this is kept separate as not all frontend traffic will go through Palo Alto firewall
paloConfig = []