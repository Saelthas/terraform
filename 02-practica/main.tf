provider "azurerm" {
  # Configuration option
  subscription_id = "62cdd463-fc5c-4eb4-9a1a-139e02f0e84e"
  features {}
}

resource "azurerm_resource_group" "rg_terraform" {
    name=var.rg_name
    location= var.location
    tags= {
        propietario ="Ruben Aruzamen"
        desplegado_desde= "Terraform"
        caso:"variables"
    }
  
}
resource "azurerm_virtual_network" "vnet_terraform" {
  name                = var.vnetName
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space       = [var.segmentoVNet[0]]
  
  tags =azurerm_resource_group.rg_terraform.tags
#    {
#     environment = "Production"
#   }
#depends_on = [ azurerm_resource_group.rg_terraform ]
}
resource "azurerm_subnet" "subnet_one_terraform" {
  name                 = var.subNet_names[0]
  resource_group_name  = azurerm_resource_group.rg_terraform.name
  virtual_network_name = azurerm_virtual_network.vnet_terraform.name
  address_prefixes     = [var.segmentoSubNets[0]]
}
resource "azurerm_subnet" "subnet_two_terraform" {
  name                 = var.subNet_names[1]
  resource_group_name  = azurerm_resource_group.rg_terraform.name
  virtual_network_name = azurerm_virtual_network.vnet_terraform.name
  address_prefixes     = [var.segmentoSubNets[1]]
}
resource "azurerm_network_security_group" "security_net" {
  name                = var.securityName
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name

  security_rule {
    name                       = var.securityRule.name
    priority                   = var.securityRule.priority
    direction                  = var.securityRule.direction
    access                     = var.securityRule.access
    protocol                   = var.securityRule.protocol
    source_port_range          = var.securityRule.all
    destination_port_range     = var.securityRule.all
    source_address_prefix      = var.securityRule.all
    destination_address_prefix = var.securityRule.all
  }

  tags = {
    environment = "develop"
  }
}