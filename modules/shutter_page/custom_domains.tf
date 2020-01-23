data "template_file" "customdomain" {
  template = file("${path.module}/templates/custom_domain.json")
}

resource "azurerm_template_deployment" "custom_domain" {
  count               = length(var.frontends)
  template_body       = data.template_file.customdomain.rendered
  name                = split(".", replace(var.frontends[count.index].custom_domain, "www.", ""))[0]
  resource_group_name = data.azurerm_resource_group.shutter.name
  deployment_mode     = "Incremental"

  parameters = {
    name     = "${azurerm_cdn_profile.main.name}/${azurerm_cdn_endpoint.shutter_endpoint[count.index].name}/${replace(var.frontends[count.index].custom_domain, ".", "-")}"
    hostName = var.frontends[count.index].custom_domain
  }

  depends_on = [azurerm_cdn_endpoint.shutter_endpoint]
}