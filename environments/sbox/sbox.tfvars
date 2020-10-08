project                    = "hmcts"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

app_gw_private_ip_address = "10.10.7.122"
data_subscription         = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
oms_env                   = "sandbox"

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-sbox-rg"

cft_apps_ag_ip_address = "10.10.7.124"
cft_apps_cluster_ips   = ["10.10.1.250", "10.10.3.250"]

frontends = []
