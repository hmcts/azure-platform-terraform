resource "azurerm_resource_group" "main" {
  name     = "${var.component}-${var.env}"
  location = "${var.location}"

  tags = "${var.common_tags}"
}