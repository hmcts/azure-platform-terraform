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
  location                       = var.location
  sku_name                       = var.apim_sku_name
  virtual_network_resource_group = local.vnet_rg
  virtual_network_name           = local.vnet_name
  environment                    = var.env
  virtual_network_type           = "Internal"
  department                     = var.department
  common_tags                    = module.ctags.common_tags
  route_next_hop_in_ip_address   = local.hub[var.hub].ukSouth.next_hop_ip
  publisher_email                = var.publisher_email
  temp_subnet_id                 = var.trigger_migration == true ? data.azurerm_subnet.temp_subnet.id : null
  temp_pip_id                    = var.trigger_migration == true ? azurerm_public_ip.temp_pip.id : null
}
