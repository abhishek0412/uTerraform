terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}


provider "azurerm" {
  features {

  }
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"
  resource_group_name = var.strResourceGroupName
  vnet_location = var.strResourceGroupLocation
  use_for_each = false
  depends_on = [ azurerm_resource_group.rgterraform ]
  tags = var.myTag
}

