# Create a resource group
resource "azurerm_resource_group" "rgterraform" {
  name     = "rg-terraform"
  location = "East US"
  tags     = local.tag_terraform

}