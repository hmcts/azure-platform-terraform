project                    = "hmcts"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

shutter_storage     = "default"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-sbox-rg"

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
  {
    name             = "idam-web-public"
    custom_domain    = "idam-web-public-aks.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules = {
      RFI = ["931130"],
      SQLI = [
        "942420",
        "942421",
        "942430",
        "942431",
        "942432",
        "942440",
        "942450"
      ]
    }
  },
]