terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}


provider "azurerm" {
  features {

  }
}

module "aci-devops-agent" {
  source                  = "anassolanki/aci-devops-agent/azurerm"
  version                 = "1.0.0"
  resource_group_name     = var.strResourceGroupName
  location                = var.strResourceGroupLocation
  enable_vnet_integration = false
  create_resource_group   = true
  

  linux_agents_configuration = {
    agent_name_prefix = "linux-agent"
    agent_pool_name   = "Automted-Pool"
    count             = 2,
    docker_image      = "anassolanki330/azp-agent"
    docker_tag        = "latest"
    cpu               = 1
    memory            = 4
    user_assigned_identity_ids   = []
    use_system_assigned_identity = false
  }

  windows_agents_configuration = {
    agent_name_prefix = "windows-agent"
    agent_pool_name   = "Automted-Pool"
    count             = 2,
    docker_image      = "jcorioland/aci-devops-agent"
    docker_tag        = "0.2-win"
    cpu               = 1
    memory            = 4
  }

  azure_devops_org_name              = var.strstrOrgName
  azure_devops_personal_access_token = var.strPAT
}