project                    = "hmcts"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

shutter_storage = "default"
cdn_sku         = "Standard_Verizon"
shutter_rg      = "shutter-app-sbox-rg"

cft_apps_ag_ip_address = "10.10.7.124"
cft_apps_cluster_ips   = ["10.10.1.250", "10.10.3.250"]

frontends = [
  {
    name             = "plum"
    custom_domain    = "plum.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
  },
]


# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
default_shutter = [
  {
    custom_domain    = "plum.sandbox.platform.hmcts.net"
    certificate_name = "STAR-sandbox-platform-hmcts-net"
  }
]
