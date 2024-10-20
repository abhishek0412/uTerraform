variable "strResourceGroupName" {
  type        = string
  description = "Name of the resource group"
  default     = "RG-SelfHostedAgent"

}

variable "strResourceGroupLocation" {
  default = "East US"
}

variable "strVnetName" {
  default = "VNET-SelfHostedAgent"
}

variable "strSubnetName" {
  default = "SUBNET-SelfHostedAgent"
}

variable "strPoolName" {
  default = "Automated-Pool"
}


variable "strstrOrgName" {
  default     = "abhishekchoudharry"
}

variable "strPAT" {
  default = "<Your PAT>"
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

