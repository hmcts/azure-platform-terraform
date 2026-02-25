resource "azurerm_api_management_api" "receive-fine-account-response" {
  name                = "receive-fine-account-response"
  resource_group_name = RG-SIT-APIM-01
  api_management_name = spnl-sit-apim-int
  revision            = "1"
  display_name        = "Receive fine account response"
  path                = "stagingenforcement"
  protocols           = ["https"]

  service_url = "https://spnl-sit-apim-int-gw.cpp.nonlive/stagingenforcement/receive-fine-account-response"
}

resource "azurerm_api_management_product" "gob" {
  product_id          = "gob"
  api_management_name = spnl-sit-apim-int
  resource_group_name = RG-SIT-APIM-01

  display_name          = "gob"
  published             = true
  subscription_required = true
  approval_required     = false
}

resource "azurerm_api_management_product_api" "gob-receive-fine-account-response" {
  api_name            = azurerm_api_management_api.receive-fine-account-response.name
  product_id          = azurerm_api_management_product.gob.product_id
  api_management_name = spnl-sit-apim-int
  resource_group_name = RG-SIT-APIM-01
}