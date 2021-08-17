data "template_file" "customdomain" {
  template = file("${path.module}/templates/custom_domain.json")
}

resource "azurerm_template_deployment" "custom_domain" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend if !contains(["jui-redirect", "fact-redirect"], frontend.name)
  }

  template_body       = data.template_file.customdomain.rendered
  name                = split(".", replace("${each.value.custom_domain}", "www.", ""))[0]
  resource_group_name = data.azurerm_resource_group.shutter.name
  deployment_mode     = "Incremental"

  parameters = {
    name     = "${azurerm_cdn_profile.main["${each.value.product}"].name}/${azurerm_cdn_endpoint.shutter_endpoint["${each.value.name}"].name}/${replace("${each.value.custom_domain}", ".", "-")}"
    hostName = "${each.value.custom_domain}"
  }

  depends_on = [azurerm_cdn_endpoint.shutter_endpoint]
}