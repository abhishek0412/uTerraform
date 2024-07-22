# Create a resource group
resource "azurerm_resource_group" "rgterraform" {
  name     = var.strResourceGroupName
  location = var.strResourceGroupLocation
  tags     = local.tag_terraform
}