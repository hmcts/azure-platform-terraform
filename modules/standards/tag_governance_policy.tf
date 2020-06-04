data "template_file" "tag_governance" {
  template = "${file("${path.module}/templates/resource_tag_policyRule.json.tmpl")}"
}

resource "azurerm_policy_definition" "tag" {
  name         = "resourceTagGovernance"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Mandatory 'managedBy' tag missing. E.g. 'managedBy' = '<Team or Individual Name>'"
  policy_rule = data.template_file.tag_governance.rendered
}