variable "strResourceGroupName" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-df-terraform"

}

variable "strResourceGroupLocation" {
  default = "East US"
}

variable "strStorageName" {
  type        = string
  description = "Storage name"
}

variable "strContainerName" {
  type        = string
  description = "Container Name"
}

