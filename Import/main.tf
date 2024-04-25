# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg-terraform" {

  location = "eastus"
  name     = "importTest"
  tags = {
    Environment = "Test"
    Purpose     = "Test"
    Org         = "Microsoft"
    Team        = "Galaxy"
  }
}

