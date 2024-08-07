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
  features {

  }
}

locals {
  tag_terraform = {
    Environment = "Test"
    Purpose     = "Firewall"
    Org         = "Microsoft"
    Team        = "Butterfly"
  }

}

