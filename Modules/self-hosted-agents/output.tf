output "linuxAgentCount" {
    value = module.aci-devops-agent.linux_agents_count
}

output "windowsAgentCount" {
    value = module.aci-devops-agent.windows_agents_count
}

output "linuxAgentNames" {
    value = module.aci-devops-agent.linux_agents_names
}

output "windowsAgentNames" {
    value = module.aci-devops-agent.windows_agents_count
}

output "HasVnetIntegration" {
    value = module.aci-devops-agent.vnet_integration_enabled
}

