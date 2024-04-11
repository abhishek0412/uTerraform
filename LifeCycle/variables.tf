variable "strResourceGroupName" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-df-terraform"

}

variable "strResourceGroupLocation" {
  default = "East US"
}

variable "myTag" {
  type = map(string)
  description = "List of tags"
  default = {
    
    Environment = "World"
    Purpose     = "Open source"
    Org         = "Open source"
    Team        = "Classic"
  
  }  
}

