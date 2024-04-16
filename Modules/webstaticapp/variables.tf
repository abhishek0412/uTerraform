variable "strResourceGroupName" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-tf-module"

}

variable "strResourceGroupLocation" {
  default = "East US"

  validation {
    condition     = (var.strResourceGroupLocation == "East US" || var.strResourceGroupLocation == "eastus")
    error_message = "Policy doesn't allow any resource in other than East US"
  }

}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}
variable "static_website_index_document" {
  description = "static website index document"
  type        = string
}
variable "static_website_error_404_document" {
  description = "static website error 404 document"
  type        = string
}

variable "myTag" {
  type        = map(string)
  description = "List of tags"
  default = {

    Environment = "Asia"
    Purpose     = "Open source"
    Org         = "Open source"
    Team        = "Classic"

  }
}

