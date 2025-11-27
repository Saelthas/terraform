resource "azurerm_resource_group" "rg_terraform" {
  name     = var.rg_name
  location = var.location
  # tags = {
  #   propietario      = local.common_tags.owner
  #   desplegado_desde = local.common_tags.manage_by
  #   #detail = local.prefix
  # }

}
resource "azurerm_virtual_network" "vnet_terraform" {
  name                = var.vnetName
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space       = [var.segmentoVNet[0]]
  
  tags =azurerm_resource_group.rg_terraform.tags
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
