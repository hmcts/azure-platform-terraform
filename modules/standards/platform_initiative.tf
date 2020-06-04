resource "azurerm_policy_set_definition" "tag_governance" {
  name         = "PlatformStandrads"
  policy_type  = "Custom"
  display_name = "Platform Standards"

  policy_definitions = <<POLICY_DEFINITIONS
    [
        {
            "policyDefinitionId": "${azurerm_policy_definition.tag.id}"
        }
    ]
POLICY_DEFINITIONS
}
