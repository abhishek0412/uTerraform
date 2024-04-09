output "rgname" {
  value       = azurerm_resource_group.rgterraform.name
  description = "Resource group name"
}

output "StorageInfo" {
  value       = azurerm_storage_account.terraStorage
  description = "Storage Info"
  sensitive   = true
}

output "ContainerInfo" {
  value       = azurerm_storage_account.terraStorage
  description = "Container Info"
  sensitive   = true
}
