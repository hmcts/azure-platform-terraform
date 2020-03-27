# Common variables - do not change these

env                 = "sbox"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-rg"

# This is to create a storage account for your teams shutter page that can be used for multiple applications.

probate_shutter_storage = "probate"

# comma separated FQDN that needs to have the shutter page from the above storage account.

probate_shutter_apps = [
  "apply-for-probate.service.gov.uk"
]