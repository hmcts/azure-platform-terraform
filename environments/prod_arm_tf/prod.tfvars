project                = "hmcts"
location               = "uksouth"
env                    = "prod"
subscription           = "prod"
ssl_mode               = "FrontDoor"
certificate_name_check = false

app_gw_private_ip_address = ["10.90.96.120"]
data_subscription         = "8999dec3-0104-4a27-94ee-6588559729d1"
privatedns_subscription   = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                   = "prod"

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-prod-rg"

cft_apps_ag_ip_address = "10.90.96.122"
cft_apps_cluster_ips   = ["10.90.79.250", "10.90.95.250"]

frontends = [
  {
    name             = "plum"
    product          = "cnp"
    custom_domain    = "plum.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
  }
]
