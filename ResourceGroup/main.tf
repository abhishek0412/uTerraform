# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}




# Create Resource Group 
/* resource "azurerm_resource_group" "rg-terraform" {
  count = 2
  location = "eastus"
  name = "rg-terraform${count.index}"  
  #name = "rg-terraform"
  tags = {
    Environment = "Test"
    Purpose     = "Test"
    Org         = "Microsoft"
    Team        = "Galaxy"
  }
} 

output "name" {
  value = azurerm_resource_group.rg-terraform[*].name
} */

resource "azurerm_resource_group" "rg-terraform" {

  #for_each = { name1="terra-Abhishek",name2="terra-Supriya", name3="terra-Baby" }
  for_each = toset(["abhishek", "supriya", "baby"])
  location = "eastus"
  name     = each.key
  tags = {
    Environment = "Test"
    Purpose     = "Test"
    Org         = "Microsoft"
    Team        = "Galaxy"
  }
}

data "azure" "name" {
  
}
output "Naam" {
  value = [for rgs in azurerm_resource_group.rg-terraform: rgs.name]
}