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
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

locals {
  tag_terraform = {
    Environment = "Test"
    Purpose     = "AKV"
    Org         = "Microsoft"
    Team        = "Galaxy"
  }

}

