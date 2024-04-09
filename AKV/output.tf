output "rgname" {
  value = azurerm_resource_group.rgterraform.name
  description = "Resource group name"
}

output "akvname" {
  value = azurerm_key_vault.terraformakv.name
  description = "AKV name"
}

output "akvid" {
  value = azurerm_key_vault.terraformakv.id
  description = "AKV ID"
  sensitive = true
}