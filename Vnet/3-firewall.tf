resource "azurerm_network_security_group" "nsg-terraform" {

  name                = var.nsg-terraform-name
  location            = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  tags                = local.tag_terraform

}
# Create Virtual Network
resource "azurerm_virtual_network" "vnetterraform" {
  name                = var.vnet-terraform-name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  dns_servers         = ["10.0.0.4", "10.0.0.5"]



  tags = local.tag_terraform

}
resource "azurerm_subnet" "subnet1terraform" {
  name                 = var.Subnet1-name
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.vnetterraform.name
  resource_group_name  = azurerm_resource_group.rgterraform.name

}

resource "azurerm_subnet" "subnet2terraform" {
  name                 = var.Subnet2-name
  address_prefixes     = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.vnetterraform.name
  resource_group_name  = azurerm_resource_group.rgterraform.name


}

resource "azurerm_public_ip" "ipterraform" {
  name                = var.ip-terraform-name
  resource_group_name = azurerm_resource_group.rgterraform.name
  location            = azurerm_resource_group.rgterraform.location
  allocation_method   = "Static"
  tags                = local.tag_terraform
  depends_on          = [azurerm_virtual_network.vnetterraform, azurerm_subnet.subnet1terraform]

}

resource "azurerm_network_interface" "nicterraform" {
  name                = "nic-terraform"
  resource_group_name = azurerm_resource_group.rgterraform.name
  location            = azurerm_resource_group.rgterraform.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1terraform.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ipterraform.id
  }
  tags = local.tag_terraform

}

resource "azurerm_firewall" "example" {
  name                = "testfirewall"
  location            = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet1terraform.id
    public_ip_address_id = azurerm_public_ip.ipterraform.id
  }
}