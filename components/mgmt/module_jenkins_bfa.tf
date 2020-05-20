data "azurerm_key_vault" "intsvc" {
  name                = var.certificate_key_vault_name
  resource_group_name = var.kv_rg_name
}

data "azurerm_virtual_network" "intsvc" {
  name                = var.mgmt_vnet_name
  resource_group_name = var.mgmt_rg_name
}

data "azurerm_subnet" "intsvc" {
  count                = length(data.azurerm_virtual_network.intsvc.subnets)
  name                 = data.azurerm_virtual_network.intsvc.subnets[count.index]
  virtual_network_name = data.azurerm_virtual_network.intsvc.name
  resource_group_name  = data.azurerm_virtual_network.intsvc.resource_group_name
}

module "buildfailureanalyzer" {
  source = "../../modules/cosmosdb"

  cosmos_account_name = "build-failure-analyzer-${var.env}"
  resource_group_name = "build-failure-analyzer"
  kind                = "MongoDB"
  subnet_ids          = data.azurerm_subnet.intsvc[*].id
}

resource "azurerm_key_vault_secret" "cosmosdbkey" {
  name         = "bfa-pri-key"
  value        = module.buildfailureanalyzer.primary_master_key
  key_vault_id = data.azurerm_key_vault.intsvc.id
}