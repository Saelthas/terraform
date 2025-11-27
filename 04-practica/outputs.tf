output "resource_group_name" {
  description = "el nombre del grupo de recursos"
  value       = module.vnet_module_terraform.resource_group_name
  sensitive   = true
}
output "resource_group_id" {
  description = "El ID del recurso"
  value       = module.vnet_module_terraform.resource_group_id
  sensitive   = true

}
output "vnet_id" {
  description = "El ID de la vNet"
  value       = module.vnet_module_terraform.vnet_id

}
output "vnet_name" {
  description = "El nombre de la vNet"
  value       = module.vnet_module_terraform.vnet_name
}
output "subnet_name" {
  description = "El nombre de la subNet"
  value       = module.vnet_module_terraform.subnet_name
}
output "subnet_segment" {
  description = "El segmento de la subNet1"
  value       = module.vnet_module_terraform.subnet_segment
}
output "subnet_segmentTwo" {
  description = "El segmento de la subNet2"
  value       = module.vnet_module_terraform.subnet_segmentTwo
}
output "network_security_group_name" {
  description = "El segmento de la nsg"
  value       = azurerm_network_security_group.terraform_nsg.name
  sensitive   = false
}
output "network_security_rule_name" {
  description = "El segmento de la nsg"
  value       = azurerm_network_security_rule.terraform_nsr.name
  sensitive   = false
}
output "network_security_rule_name_443" {
  description = "El segmento de la nsg"
  value       = azurerm_network_security_rule.terraform_nsr_443.name
  sensitive   = false
}
output "network_security_rule_name_80" {
  description = "El segmento de la nsg"
  value       = azurerm_network_security_rule.terraform_nsr_80.name
  sensitive   = false
}
output "network_public_ip_address" {
  description = "El segmento de la nsg"
  value       = azurerm_public_ip.terraform_public_ip.ip_address
  sensitive   = false
}
output "network_public_ip_name" {
  description = "El segmento de la nsg"
  value       = azurerm_public_ip.terraform_public_ip.name
  sensitive   = false
}
output "nic_name" {
  description = "El segmento de la nsg"
  value       = azurerm_network_interface.terraform_nic.name
  sensitive   = false
}