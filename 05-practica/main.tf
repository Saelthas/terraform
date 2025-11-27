resource "azurerm_resource_group" "terraform_rg" {
 name="RubenAruzamen-lab07-rg" 
 location = var.location

}
# module "vnet" {
#   source  = "Azure/vnet/azurerm"
#   version = "5.0.1"
#   # insert the 2 required variables here
#   resource_group_name = azurerm_resource_group.terraform_rg.name
#   vnet_location = var.location
#   subnet_names = ["subnetOne","subnetTwo","subnetThree"]
#   subnet_prefixes = [ "10.0.11.0/24", "10.0.22.0/24", "10.0.33.0/24" ]
#   vnet_name = "rAruzamen-vnet"
# }
# module "github-vnet" {
#   source  = "github.com/Saelthas/terraform"
  
#   # insert the 2 required variables here
#   resource_group_name = azurerm_resource_group.terraform_rg.name
#   vnet_location = var.location
#   subnet_names = ["subnetOne","subnetTwo"]
#   subnet_prefixes = [ "10.0.11.0/24", "10.0.22.0/24"]
#   vnet_name = "rAruzamen-git-vnet"
# }