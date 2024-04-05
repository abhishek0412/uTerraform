#####################################################################
# Block-1: Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

#####################################################################
# Block-2: Provider Block
provider "azurerm" {
  features {}
}

locals {
  tag_terraform = {
    Environment = "Test"
    Purpose = "Test"
    Org = "Microsoft"
    Team = "Galaxy"
  }

}
#####################################################################
# Block-3: Resource Block
# Create a resource group
resource "azurerm_resource_group" "rgterraform" {
  name     = "rg-terraform"
  location = "East US"
  tags     = local.tag_terraform

}

resource "azurerm_network_security_group" "nsg-terraform" {

  name                = "nsg-terraform"
  location            = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  tags                = local.tag_terraform

}
# Create Virtual Network
resource "azurerm_virtual_network" "vnetterraform" {
  name                = "vnet-terraform"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg-terraform.name
  }

  tags = local.tag_terraform

}


