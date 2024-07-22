variable "strResourceGroupName" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-Firewall"

}

variable "strResourceGroupLocation" {
  default = "East US"
}

variable "nsg-terraform-name" {
  type        = string
  description = "NSG name"
}

variable "vnet-terraform-name" {
  type        = string
  description = "VNET Name"
}

variable "Subnet1-name" {
  type        = string
  description = "Subnet 1 name"
}

variable "Subnet2-name" {
  type        = string
  description = "Subnet 2 Name"
}

variable "ip-terraform-name" {
  type        = string
  description = "ip-terraform name"
}

variable "nic-terraform-name" {
  type        = string
  description = "nic-terraform Name"
}
