resource "azurerm_resource_group" "rg_terraform" {
  name     = "${local.prefix}-rg"
  location = var.location
  tags = {
    propietario      = local.common_tags.owner
    desplegado_desde = local.common_tags.manage_by
    #detail = local.prefix
  }

}
resource "azurerm_virtual_network" "vnet_terraform" {
  name                = "${local.prefix}-vnet"
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space       = [var.segmentoVNet[0]]
  
  tags =azurerm_resource_group.rg_terraform.tags
#    {
#     environment = "Production"
#   }
#depends_on = [ azurerm_resource_group.rg_terraform ]
}

data "azurerm_virtual_network" "vnet_terraform" {
  name                = "vNet_rAruzamen"
  resource_group_name = "Recursos_rAruzamen"
}
data "azurerm_resource_group" "data_rg_terraform_two" {
  name = "TFCourse-dev-RubenAruzamen-rg"
}
output "id" {
  value = data.azurerm_resource_group.data_rg_terraform_two.id
  
}
output "vnet_id" {
  value = data.azurerm_virtual_network.vnet_terraform.id
  
}
resource "azurerm_subnet" "subnet_one_terraform" {
  name                 = "${local.prefix}-subnet"
  resource_group_name  = data.azurerm_virtual_network.vnet_terraform.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet_terraform.name
  address_prefixes     = [var.segmentoSubNets[2]]
}
# resource "subnet" "vnet_terraform_two" {
#   name                = "${local.prefix}-vnet_two"
#   location            = data.azurerm_resource_group.data_rg_terraform.location
#   resource_group_name = data.azurerm_resource_group.data_rg_terraform_two.name
#   address_space       = [var.segmentoVNetTwo[0]]
  
#   tags =azurerm_resource_group.rg_terraform.tags
#    {
#     environment = "Production"
#   }
#depends_on = [ azurerm_resource_group.rg_terraform ]
