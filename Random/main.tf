terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }

    null = {
      source = "hashicorp/null"
      version = "3.2.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstates"
    storage_account_name = "tfstates0412"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "random" {
  # Configuration options
}


resource "random_string" "randomName" {
  length = terraform.workspace == "default" ? 6 : 20

}

resource "random_integer" "randomNumber" {

  min = terraform.workspace == "default" ? 9999 : 999999
  max = terraform.workspace == "default" ? 999999999 : 999999999999
}

resource "random_password" "randomPassword" {
  length = terraform.workspace == "default" ? 99 : 99
}

resource "random_pet" "randomPetName" {
prefix = terraform.workspace != "default" ? "qa" : null
}

locals {
  current_timestamp = timestamp()
  current_day       = formatdate("YYYY-MM-DD", local.current_timestamp)
  current_time      = formatdate("hh:mm:ss", local.current_timestamp)
  current_day_name  = formatdate("EEEE", local.current_timestamp)
}

output "randomName" {
  value = random_string.randomName.result
}

output "randomNumber" {
  value = random_integer.randomNumber.result
}

output "randomPassword" {
  value     = random_password.randomPassword
  sensitive = true
}

output "randomPetName" {
  value = random_pet.randomPetName.id
}

output "current_timestamp" {
  value = local.current_timestamp
}
output "current_day" {
  value = local.current_day
}
output "current_time" {
  value = local.current_time
}
output "current_day_name" {
  value = local.current_day_name
}
