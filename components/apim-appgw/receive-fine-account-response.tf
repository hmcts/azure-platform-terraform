variable "resource_group_name" {
  type    = string
  default = "RG-SIT-APIM-01"
}

variable "api_management_name" {
  type    = string
  default = "spnl-sit-apim-int"
}

variable "common_tags" {
  type = map(string)

  default = {
    Environment = "SIT"
    Application = "APIM"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_api_management_api" "receive-fine-account-response" {
  name                = "receive-fine-account-response"
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = "1"
  display_name        = "Receive fine account response"
  path                = "stagingenforcement"
  protocols           = ["https"]

  service_url = "https://spnl-sit-apim-int-gw.cpp.nonlive/stagingenforcement/receive-fine-account-response"

  tags = var.common_tags
  # Represents the receive-fine-account-response API
}

resource "azurerm_api_management_product" "gob" {
  product_id          = "gob"
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name

  display_name          = "gob"
  published             = true
  subscription_required = true
  approval_required     = false
  tags = var.common_tags
  # Represents the gob product
}

resource "azurerm_api_management_product_api" "gob-receive-fine-account-response" {
  api_name            = azurerm_api_management_api.receive-fine-account-response.name
  product_id          = azurerm_api_management_product.gob.product_id
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  tags = var.common_tags
  # Adds receive-fine-account-response API to gob product
}
