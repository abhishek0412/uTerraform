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
} */

resource "azurerm_resource_group" "name" {

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