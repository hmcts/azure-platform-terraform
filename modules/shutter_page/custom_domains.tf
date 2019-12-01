data "template_file" "customdomain" {
  template = "${file("${path.cwd}/templates/custom_domain.json")}"
}

resource "azurerm_template_deployment" "custom_domain" {
  count               = length(var.shutter_app_name) 
  template_body       = data.template_file.customdomain.rendered
  name                = var.shutter_app_name[count.index]
  resource_group_name = data.azurerm_resource_group.shutter.name
  deployment_mode     = "Incremental"

  parameters = {
    # name       = "${azurerm_cdn_profile.main.name}/${azurerm_cdn_endpoint.shutter_endpoint[count.index].name}/${replace("${var.shutter_app_name[count.index]}.${var.custom_domain}", ".", "-")}"
    #  to test the current config
    name       = "${azurerm_cdn_profile.main.name}/hmcts-shutter-apps-sbox/${replace("${var.shutter_app_name[count.index]}.${var.custom_domain}", ".", "-")}"
    hostName   = "${var.shutter_app_name[count.index]}.${var.custom_domain}"
  }
} 