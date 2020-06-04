resource "azurerm_policy_set_definition" "example" {
  name         = "PlatformStandrads"
  policy_type  = "Custom"
  display_name = "TestPolicySet"

  policy_definitions = <<POLICY_DEFINITIONS
    [
        {
            "policyDefinitionId": "${azurerm_policy_definition.policy.id}"
        }
    ]
POLICY_DEFINITIONS
}
