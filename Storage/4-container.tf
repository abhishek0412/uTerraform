resource "azurerm_storage_container" "tfContainer" {
  name                 = var.strContainerName
  storage_account_name = azurerm_storage_account.terraStorage.name
}