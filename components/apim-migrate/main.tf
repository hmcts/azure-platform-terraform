module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

data "azurerm_api_management" "apim" {
  name                = "${var.department}-api-mgmt-${var.env}"
  resource_group_name = local.vnet_rg
}

# resource "azurerm_subnet" "temp_subnet" {
#   name = "temp-migration-subnet"
#   virtual_network_name = local.vnet_name
#   resource_group_name = local.vnet_rg
#   address_prefixes = [""] // var this
# }

data "azurerm_subnet" "temp_subnet" {
  name                 = "iaas"
  resource_group_name  = local.vnet_rg
  virtual_network_name = local.vnet_name
}

resource "azurerm_public_ip" "temp_pip" {
  name                = "temp-pip"
  resource_group_name = local.vnet_rg
  location            = var.location
  allocation_method   = "Static"
  domain_name_label   = "temp-pip"

  tags = module.ctags.common_tags
  sku  = "Standard"
}

module "api-mgmt" {
  source                         = "git::https://github.com/hmcts/cnp-module-api-mgmt-private.git?ref=DTSPO-17136-apim-upgrade"
  location                       = data.azurerm_api_management.apim.location
  sku_name                       = data.azurerm_api_management.apim.apim_sku_name
  virtual_network_resource_group = data.azurerm_api_management.apim.vnet_rg
  virtual_network_name           = data.azurerm_api_management.apim.vnet_name
  environment                    = data.azurerm_api_management.apim.env
  virtual_network_type           = "Internal"
  department                     = data.azurerm_api_management.apim.department
  common_tags                    = module.ctags.common_tags
  route_next_hop_in_ip_address   = local.hub[var.hub].ukSouth.next_hop_ip
  publisher_email                = data.azurerm_api_management.apim.publisher_email
  temp_subnet_id                 = var.trigger_migration == true ? data.azurerm_subnet.temp_subnet.id : null
  temp_pip_id                    = var.trigger_migration == true ? azurerm_public_ip.temp_pip.id : null
}
