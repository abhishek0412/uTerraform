resource "azurerm_storage_account" "terraStorage" {
  name = var.strStorageName
  location = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tag_terraform
}