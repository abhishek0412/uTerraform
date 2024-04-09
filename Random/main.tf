terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "random" {
  # Configuration options
}


resource "random_string" "randomName" {
  length = 6

}

resource "random_integer" "randomNumber" {

  min = 9999
  max = 999999
}

resource "random_password" "randomPassword" {
  length = 9
}

resource "random_pet" "randomPetName" {

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
