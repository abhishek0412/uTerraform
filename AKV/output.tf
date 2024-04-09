output "rgname" {
  value       = azurerm_resource_group.rgterraform.name
  description = "Resource group name"
}

output "akvname" {
  value       = azurerm_key_vault.terraformakv.name
  description = "AKV name"
}

output "akvid" {
  value       = azurerm_key_vault.terraformakv.id
  description = "AKV ID"
  sensitive   = true
}

output "certIdImported" {
  value = azurerm_key_vault_certificate.terroformcert.id
}

output "keyGenerated" {
  value = azurerm_key_vault_key.keygenerated.id
}

output "secret" {
  value     = azurerm_key_vault_secret.terraformsecret.value
  sensitive = true
}