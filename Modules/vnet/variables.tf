variable "strResourceGroupName" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-tf-module"

}

variable "strResourceGroupLocation" {
  default = "East US"
   
   validation {
     condition = var.strResourceGroupLocation=="East US"
     error_message = "Policy doesn't allow any resource in other than East US"
   }

}

variable "myTag" {
  type = map(string)
  description = "List of tags"
  default = {
    
    Environment = "Asia"
    Purpose     = "Open source"
    Org         = "Open source"
    Team        = "Classic"
  
  }  
}

