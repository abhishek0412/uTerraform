data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "OnlyLocation" {
  name         = "only-deploy-in-westeurope"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "No other than eastus location allowed"

  policy_rule = <<POLICY_RULE
 {
    "if": {
      "not": {
        "field": "location",
        "equals": "eastus"
      }
    },
    "then": {
      "effect": "Deny"
    }
  }
POLICY_RULE
}

resource "azurerm_subscription_policy_assignment" "DenySubscriptionAssignment" {
  name                 = "DenySubscriptionAssignment"
  policy_definition_id = azurerm_policy_definition.OnlyLocation.id
  subscription_id      = data.azurerm_subscription.current.id
}