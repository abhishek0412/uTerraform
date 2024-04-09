variable "strResourceGroupName" {
  type = string
  description = "Name of the resource group"
  default = "rg-df-terraform"
  
}

variable "strResourceGroupLocation" {
  default = "East US"
}

variable "strAKVName" {
  default = "akv-df-terraform"
}