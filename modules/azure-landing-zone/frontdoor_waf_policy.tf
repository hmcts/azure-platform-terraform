resource "azurerm_frontdoor_firewall_policy" "default" {
  name                              = "default"
  resource_group_name               = azurerm_resource_group.main.name
  enabled                           = true
  mode                              = var.waf_mode

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    dynamic "override" {
      iterator = rules
      for_each = var.disabled_waf_rules

      content {
        rule_group_name = rules.key
        dynamic "rule" {
          iterator = rule_id
          for_each = rules.value

          content {
            rule_id = rule_id.value
            enabled = false
            action  = "Block"
          }
        }
      }
    }
  }

    managed_rule {
        type      = "BotProtection"
        version   = "preview-0.1"
    }
  }