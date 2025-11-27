output "resource_group_name" {
    description = "El nombre del recurso"
  value = azurerm_resource_group.rg_terraform.name
  sensitive = true
  
}
output "resource_group_id" {
    description = "El ID del recurso"
  value = azurerm_resource_group.rg_terraform.id
  sensitive = true
  
}
output "vnet_id" {
     description = "El ID de la vNet"
  value = azurerm_virtual_network.vnet_terraform.id
  
}
output "vnet_name" {
    description = "El nombre de la vNet"
  value = azurerm_virtual_network.vnet_terraform.name
}
output "subnet_name" {
    description = "El nombre de la subNet"
  value = azurerm_subnet.subnet_one_terraform.name
}
output "subnet_segment" {
    description = "El segmento de la subNet1"
  value = azurerm_subnet.subnet_one_terraform.address_prefixes
}
output "subnet_segmentTwo" {
    description = "El segmento de la subNet2"
  value = azurerm_subnet.subnet_two_terraform.address_prefixes
}