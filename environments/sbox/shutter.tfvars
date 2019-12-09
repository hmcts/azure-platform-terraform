shutter_storage     = "default"
env                 = "sbox"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-rg"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
    "plum.sandbox.platform.hmcts.net"
]


