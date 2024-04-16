# Create a resource group
resource "azurerm_resource_group" "rgterraform" {
  name     = var.strResourceGroupName
  location = var.strResourceGroupLocation
  #tags     = local.tag_terraform
  tags = var.myTag
  lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [tags]
  }
}