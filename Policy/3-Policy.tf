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

  resource "azurerm_subscription_policy_assignment" "auditvms" {
  name = "audit-vm-manageddisks"
  subscription_id = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d" 
  description = "Shows all virtual machines not using managed disks"
  display_name = "Audit VMs without managed disks assignment"
  
  }

   resource "azurerm_subscription_policy_assignment" "auditkvpublicaccess" {
  name = "audit-kv-public-access"
  subscription_id = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/405c5871-3e91-4644-8a63-58e19d68ff5b"
  description = "Disable public network access for your key vault so that it's not accessible over the public internet. This can reduce data leakage risks. Learn more at: https://aka.ms/akvprivatelink."
  display_name = "Disable public network access for your key vault so that it's not accessible over the public internet."
  }