# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "************************************************"
resource "azurerm_resource_group" "rg-new-terraform" {
  location   = "eastus"
  managed_by = null
  name       = "rg-tfStates"
  tags = {
    Environment = "Test"
    Org         = "Microsoft"
    Purpose     = "Storage"
    Team        = "Galaxy"
  }
}
