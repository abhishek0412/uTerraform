output "storage_account_id" {
  description = "storage account id"
  value       = azurerm_storage_account.webappStorage.id
}
output "storage_account_name" {
  description = "storage account name"
  value       = azurerm_storage_account.webappStorage.name
}

output "staticwebsitename" {
    value = azurerm_storage_account.webappStorage.primary_web_endpoint
}