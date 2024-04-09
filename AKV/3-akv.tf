data "azurerm_client_config" "current" {
}
resource "azurerm_key_vault" "terraformakv" {
    name = "akv-terraform"
    location = azurerm_resource_group.rgterraform.location
    resource_group_name = azurerm_resource_group.rgterraform.name
    sku_name = "standard"
    tenant_id = data.azurerm_client_config.current.tenant_id
    tags = local.tag_terraform
}